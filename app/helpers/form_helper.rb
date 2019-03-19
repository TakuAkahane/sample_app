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

    # テキストフィールド
    def text_field(attribute, label_args = {}, args = {})
      required, form_name, readonly = extend_args(label_args)
      label_class = label_class(label_args, 'mb-3')
      @template.concat_tag(:div, class: line_class(label_args, 'mx-auto mb-5')) do
        @template.concat()
    end
