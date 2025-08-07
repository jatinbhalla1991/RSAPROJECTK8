

# Assign the API permission (Tenant.Read.All)
resource "azuread_app_role_assignment" "powerbi_permission" {
  principal_object_id   = "011cc156-a49e-453c-b7ef-ce0a0a0ff9ad"
  app_role_id           = "654b31ae-d941-4e22-8798-7add8fdf049f"
  resource_object_id    = "5de4b4be-951f-4389-b464-43f253210a21"
}
