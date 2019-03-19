# encoding: utf-8
# frozen_string_literal: true

module FormHelper
  class OriginalFormBuilder < Action::Helpers::FormBuilder
    # label_args分解
    def extend_args(args)
      required = args.key?(:required) && args[:required] ? true : false
      form_name = args.key?(:form_name) ? args[:form_name] : nil
      readonly = args.key?(:readonly) && args[:readonly] ? true : false
      [required, form_name, readonly]
    end

    # ラベルのclass作成
    def label_class(args, default)
      return default unless args.key?(:label_class)
      args[:label_class]
    end

    # ラベル作成
    def label_for(attribute, required, form_name, label_class = nil, no_reaction = false)
      label_class = label_class.nil? ? 'active font-middle mb-3' : label_class
      @template.content_tag(:label, class: label_class, for: no_reaction ? '' : original_id(attribute)) do
        @template.concat(I18n.t(form_name.present? ? form_name : attribute))
        @template.concat(@template.content_tag(:spam, I18n.t('required'), class: 'badge-pill badge-danger pink lighten-2 font-small ml-3')) if required
      end
    end

    # ID生成
    def original_id(attribute)
      suffix = '_field'
      if attribute.instance_of? Symbol
        attribute.to_s + suffix
      else
        attribute + suffix
      end
    end

    # エラータグ
    def error_tag(attribute)
      return if @object.nil? || @object.errors.nil? || @object.errors.details.empty? || !@object.errors.details.key?(attribute)
      element = @object.errors.messages[attribute][0]
      value = element.instance_of?(Hash) ? element[:html].html_safe : element
      message = @object.class.human_attribute_name(attribute) + value
      "<div class='invalid-feedback' style='display:block'>#{message}></div>".html_safe
    end

    # テキストフィールド
    def text_field(attribute, label_args = {}, args = {})
      required, form_name, readonly = extend_args(label_args)
      label_class = label_class(label_args, 'mb-3')
      @template.concat_tag(:div, class: line_class(label_args, 'mx-auto mb-5')) do
        @template.concat(
          form_name == 'blank' ? '' : label_for(attribute, required, form_name, label_class, true)
        )
        @template.concat(
          super(attribute, args_edit(attribute, args, readonly))
        )
        @template.concat(error_tag(attribute))
      end
    end

  end
end
