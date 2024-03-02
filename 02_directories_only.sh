from urllib.parse import urlparse, urlunparse

def extract_folder_path(url):
    parsed_url = urlparse(url)
    # Split the path on '/' and filter out the last segment if it contains a '.'
    path_segments = parsed_url.path.split('/')
    if path_segments[-1].count('.') > 0:
        path_segments = path_segments[:-1]  # Remove the last segment if it's a file
    # Reconstruct the path without the file name, if it was removed
    path = '/'.join(path_segments)
    # Reconstruct the URL with the modified path
    folder_path = urlunparse((parsed_url.scheme, parsed_url.netloc, path, '', '', ''))
    return folder_path.rstrip('/')

# Open the file with URLs and process each line
with open('01_output_gau.txt', 'r') as file:
    for line in file:
        url = line.strip()  # Remove any leading/trailing whitespace
        folder_path = extract_folder_path(url)
        print(folder_path)
