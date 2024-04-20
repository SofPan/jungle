module Admin::SalesHelper
  def active_sale?
    Sale.active.any?
  end
end
