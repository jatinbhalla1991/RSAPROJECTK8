
(* provider "azurerm" {
  client_id       = "e501fa1f-2454-4118-bfe7-f6c44bc9d3ac"
  client_secret   = "Q9G8Q~1OxB7Pzm0desb~ux~oFkpGR710iHy_mbkH"
  tenant_id       = "8c423a15-2f64-4e2a-9981-d819d5c80d61"
  subscription_id = "5d8d00d6-b1b3-4166-ad08-213d6a1e078e"
  features {}
}

# Lookup your SPN (Service Principal) by name
data "azuread_application" "my_app" {
  display_name = "jenkins" # <-- Replace with your actual SPN name
}

# Power BI Service Principal (well-known Microsoft app)
data "azuread_service_principal" "powerbi" {
  client_id = "00000009-0000-0000-c000-000000000000"
}

# Extract the app role for Tenant.Read.All
locals {
  tenant_read_all_role_id = [
    for role in data.azuread_service_principal.powerbi.app_roles : role.id
    if role.value == "Tenant.Read.All"
  ][0]
}
 *)
# Assign the API permission (Tenant.Read.All)
resource "azuread_app_role_assignment" "powerbi_permission" {
  principal_object_id   = "011cc156-a49e-453c-b7ef-ce0a0a0ff9ad"
  app_role_id           = "654b31ae-d941-4e22-8798-7add8fdf049f"
  resource_object_id    = "5de4b4be-951f-4389-b464-43f253210a21"
}
