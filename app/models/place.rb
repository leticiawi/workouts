class Place < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  validates :address, presence: true
end

# quando a pessoa esta criando um endereco, ela esta criando um trainning.
# quando o treinador cria um trainning, ele tambem coloca o endereco.
# no campo de busca, deve ser adicionado um endereco ao treino
#
