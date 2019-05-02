<<<<<<< HEAD
json.extract! listing, :id, :title, :description, :created_at, :updated_at
json.url listing_url(listing, format: :json)
=======
json.extract! listing, :id, :created_at, :updated_at
json.url listing_url(listing, format: :json)
>>>>>>> dev
