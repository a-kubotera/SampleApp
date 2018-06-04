class NestedUniqueValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    column = options[:column]
    # 削除されたものをvalueから排除
    value = value.reject(&:marked_for_destruction?).map{|i| i.send(column) }
    return if value.size == value.uniq.size
    # 重複しているものを取得
    duplicate = value.select.with_index { |a,i| value.index(a) != i }
    
    # //FIXME 中間テーブルのときに名称を取得しないと・・
    duplicate.each do |value|
      record.errors[attribute] << (options[:message] || I18n.t('errors.messages.duplicated', data: value))
    end
  end
end
