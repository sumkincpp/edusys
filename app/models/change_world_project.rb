class ChangeWorldProject < ActiveRecord::Base
  attr_accessible :authors, :district, :nomination, :phone_sup,
                  :phone_sup_mob, :project_name, :school, :supervisor, :document

  has_and_belongs_to_many :users

  mount_uploader :document, DocumentUploader


  HUMANIZED_COLUMNS = {:authors => "Авторы", :district => "Округ",
                       :nomination => "Номинация", :phone_sup => "Контактный телефон руководителя",
                       :phone_sup_mob => "Мобильный телефон руководителя", :project_name => "Название проекта",
                       :school => "Образовательное учреждение",
                       :supervisor => "Руководитель",
                       :document => "Файл аннотации"}

#  def self.human_attribute_name(attribute)
#    HUMANIZED_COLUMNS[attribute.to_sym] || super
# end
  validates_presence_of :document, :nomination, :district, :school, :project_name, :authors, :phone_sup, :supervisor

  def project_uid
    "001-" + Time.new().year.to_s[2..4] + ("-%05d" % self.id)
  end
end
