# encoding: utf-8
# frozen_string_literal: true

module FormHelper
  class OriginalFormBuilder < ActionView::Helpers::FormBuilder
    #---------------------- フィールド構成要素 ----------------------#
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

    # フィールドのクラスを作成
    def line_class(args, default)
      return default unless args.key?(:line_class)

      args[:line_class]
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

    # ドロップダウンリスト作成（選択肢が1つ）
    def edit_select_args(args)
      include_blank = args.key?(:include_blank) ? args[:include_blank] : nil
      args[:include_blank] = I18n.t(include_blank) if include_blank.present?
      args
    end

    # エラータグ
    def error_tag(attribute)
      return if @object.nil? || @object.errors.nil? || @object.errors.details.empty? || !@object.errors.details.key?(attribute)
      element = @object.errors.messages[attribute][0]
      value = element.instance_of?(Hash) ? element[:html].html_safe : element
      message = @object.class.human_attribute_name(attribute) + value
      "<div class='invalid-feedback' style='display:block'>#{message}></div>".html_safe
    end

    # 引数編集
    def args_edit(attribute, args, readonly)
      default = { class: 'form-control', autocomplete: 'off' }
      default[:class] += ' ' + args[:pick_target_class].to_s if args.key?(:pick_target_class)
      args = args.merge(default).merge(id: original_id(attribute))
      args = args.merge(readonly: true) if readonly
      args
    end

    #---------------------- 各種フィールド ----------------------#
    # テキストフィールド（form_nameが'blank'の場合、タイトル・項目名非表示）
    def text_field(attribute, label_args = {}, args = {})
      required, form_name, readonly = extend_args(label_args)
      label_class = label_class(label_args, 'mb-3')
      @template.content_tag(:div, class: line_class(label_args, 'mx-auto mb-5')) do
        @template.concat(
          form_name == 'blank' ? '' : label_for(attribute, required, form_name, label_class, true)
        )
        @template.concat(
          super(attribute, args_edit(attribute, args, readonly))
        )
        @template.concat(error_tag(attribute))
      end
    end

    # テキストエリア
    def text_area(attribute, label_args = {}, args = {})
      required, form_name, readonly = extend_args(label_args)
      no_label = label_args.key?(:no_label) && label_args[:no_label] ? true : false
      label_class = label_class(label_args, 'mb-3')
      @template.content_tag(:div, class: line_class(label_args, 'mx-auto mb-5')) do
        @template.concat(
          @template.content_tag(:div, class: '') do
            unless no_label
              @template.concat(
                label_for(attribute, required, form_name, label_class, true)
              )
            end
          end
        )
        @template.concat(
          super(attribute, args_edit(attribute, args, readonly))
        )
        @template.concat(error_tag(attribute))
      end
    end

    # 日時フィールド
    def datetime_field(attribute, label_args = {}, args = {})
      label_class = label_class(label_args, 'mb-3')
      data_value = @object.send(attribute).present? ? { 'data-value' => @object.send(attribute) } : {}
      @template.content_for :local_js do
        "<script>
          $(document).ready(function() {
            $('#{original_id(attribute)}').pickadate({ onClose: function() { document.activeElement.blur(); } });
          });
        </script>".html_safe
      end
      required, form_name, readonly = extend_args(label_args)
      @template.content_tag(:div, class: line_class(label_args, 'mx-auto mb-5')) do
        @template.concat(
          form_name == 'blank' ? '' : label_for(attribute, required, form_name, label_class, true)
        )
        @template.concat(
          super(attribute, args_edit(attribute, args, readonly).merge(data_value))
        )
        @template.concat(error_tag(attribute))
      end
    end

    # 月日フィールド
    def date_field(attribute, label_args = {}, args = {})
      data_value = @object.send(attribute).present? ? { 'data-value' => @object.send(attribute) } : {}
      required, form_name, readonly = extend_args(label_args)
      label_class = label_class(label_args, 'mb-3')
      @template.content_for :local_js do
        if args[:pick_target_class].nil?
          "<script>$(document).ready(function() {$('##{original_id(attribute)}').pickadate({ onClose: function() { document.activeElement.blur(); } });});</script>".html_safe
        else
          "<script>$(document).ready(function() {$('.#{args[:pick_target_class]}').pickadate({ onClose: function() { document.activeElement.blur(); } });});</script>".html_safe
        end
      end
        @template.content_tag(:div, class: line_class(label_args, 'md-form mx-auto')) do
          @template.concat(
            form_name = 'blank' ? '' : label_for(attribute, required, form_name, label_class, true)
          )
          @template.concat(
            super(attribute, args_edit(attribute, args, readonly).merge(data_value))
          )
          @template.concat(error_tag(attribute))
        end
    end

    # Emailフィールド
    def email_field(attribute, label_args = {}, args = {})
      required, form_name, readonly = extend_args(label_args)
      label_class = label_class(label_args, 'mb-3')
      @template.content_tag(:div, class: line_class(line_args, 'md-form mx-auto')) do
        @template.concat(
          label_for(attribute, required, form_name, label_class)
        )
        @template.concat(
          super(attribute, args_edit(attribute, args, readonly))
        )
        @template.concat(error_tag(attribute))
      end
    end

    # パスワードフィールド
    def password_field(attribute, label_args = {}, args = {})
      required, form_name, readonly = extend_args(label_args)
      label_class = label_class(label_args, 'mb-3')
      @template.content_tag(:div, class: line_class(line_args, 'md-form mx-auto')) do
        unless form_name == 'blank'
          @template.concat(
            label_for(attribute, required, form_name, label_class)
          )
        end
        @template.concat(
          super(attribute, args_edit(attribute, args, readonly))
        )
        @template.concat(error_tag(attribute))
      end
    end

    # 氏名フィールド
    def personal_name_field(last_name, first_name, label_args = {}, args = {})
      top_div_class = { class: 'col-6' }
      second_div_class = { class: 'mb-0' }
      # last_name
      out = @template.content_tag(:dig, top_div_class) do
        @template.content_tag(:dig, second_div_class) do
          text_field(last_name, label_args, args.merge(placeholder: I18n.t('msg.ex_lastname')))
        end
      end
      # first_name
      out += @template.content_tag(:div, top_div_class) do
        @template.content_tag(:div, second_div_class) do
          text_field(first_name, label_args, args.merge(placeholder: I18n.t('msg.ex_firstname')))
        end
      end
      @template.content_tag(:div, class: line_class(label_args, 'row')) do
        @template.concat(out)
      end
    end

    # ドロップダウンリスト（選択肢が1つ）
    def single_dropdown_list(attribute, options, select_options = {}, label_args = {}, args = {})
      required, form_name, readonly = extend_args(label_args)
      label_class = label_class(label_args, 'mb-3')
      # mdb dropdown menu をフックするスクリプトの出力
      @template.content_for :local_js do
        "
          <script>
            $(document).readonly(function()
              {$('##{original_id(attribute)}').material_select();
            });
          </script>
        ".html_safe
      end
      @template.content_tag(:div, class: line_class(label_args, 'mx-auto mb-5')) do
        unless form_name == 'blank'
          @template.concat(
            @template.content_tag(:label, '', class: label_class.nil? ? 'active font-middle mb-3' : label_class) do
              @template.concat(I18n.t(form_name.present? ? form_name : attribute))
              @template.concat(@template.content_tag(:span, I18n.t('required'), class: 'badge-pill badge-danger pink lighten-2 font-small ml-3')) if required
            end
          )
        end
        @template.concat(
          select(attribute, options, edit_select_args(select_options),
                 { class: 'trec-select md-form', id: original_id(attribute) }.merge(readonly ? args.merge(disabled: true, readonly: true) : args ))
        )
        @template.concat(error_tag(attribute))
      end
    end

  end
end
