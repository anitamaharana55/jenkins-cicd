import requests
import json

def get_azure_instance_metadata():
    metadata_url = "http://169.254.169.254/metadata/instance?api-version=2021-02-01"
    headers = {'Metadata': 'true'}
    try:
        response = requests.get(metadata_url, headers=headers)
        response.raise_for_status()  # Raise an exception for bad status codes
        if response.status_code == 200:
            try:
                return response.json()
            except json.JSONDecodeError:
                return {"error": "Failed to parse JSON response"}
        else:
            return {"error": "Failed to retrieve metadata - " + response.text}
    except requests.exceptions.RequestException as e:
        return {"error": f"Request failed - {str(e)}"}

instance_metadata = get_azure_instance_metadata()
print(json.dumps(instance_metadata, indent=4))