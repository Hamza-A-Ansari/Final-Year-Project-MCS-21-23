import numpy as np
import cv2
import streamlit as st
from screeninfo import get_monitors
import os
current_directory = os.getcwd()
# Run your Streamlit app



# Load the pre-trained model for face detection
face_cascade = cv2.CascadeClassifier(
    cv2.data.haarcascades + "haarcascade_frontalface_default.xml")


@st.cache_data(ttl=600)
def load_glasses_images():
    glasses = [
        cv2.resize(cv2.imread("images/10.png", -1), (10000, 5000)),
    ]
    return glasses

# Define the function to switch between glasses


def switch_glasses(selected_glass_index, glasses):
    selected_glass_index += 1
    if selected_glass_index >= len(glasses):
        selected_glass_index = 0
    return selected_glass_index

# Define the main function to overlay glasses on a face


def overlay_glasses_on_face(image, glasses, selected_glass_index, x_offset, y_offset):
    # Convert the frame to grayscale
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

    # Detect the faces in the frame
    faces = face_cascade.detectMultiScale(gray, 1.3, 5)

    for (x, y, w, h) in faces:
        # Calculate the position of the glasses based on the face position and offsets
        x_pos = x + x_offset
        y_pos = y + -13

        # Resize the glasses image to fit the detected face
        glass_image = cv2.resize(glasses[selected_glass_index], (w, h))

        # Overlay the glasses on the face
        alpha_s = glass_image[:, :, 3] / 255.0
        alpha_l = 1.0 - alpha_s
        for c in range(0, 3):
            image[y_pos:y_pos+h, x_pos:x_pos+w, c] = (
                alpha_s * glass_image[:, :, c] +
                alpha_l * image[y_pos:y_pos+h, x_pos:x_pos+w, c]
            )

    return image, selected_glass_index

# Define the main function to run the app

import streamlit as st
from screeninfo import get_monitors
import cv2


def run():
    # Set the title and page layout
    st.set_page_config(page_title='Glasses on Face', layout='centered')

    # Initialize session state
    if "show_sliders" not in st.session_state:
        st.session_state.show_sliders = False

    # Set the app title
    st.title('Glasses on Face')

    # Load the glasses images
    glasses = load_glasses_images()

    # Define the initial index of the selected glasses
    selected_glass_index = 0

    # Start the webcam
    cap = cv2.VideoCapture(0)

    # Check if the webcam is opened successfully
    if not cap.isOpened():
        st.error("Failed to open webcam.")
        return

    # Create a streamlit image placeholder
    image_placeholder = st.empty()

    # Create a button to show/hide the sliders
    if st.button("Show/Hide Sliders"):
        st.session_state.show_sliders = not st.session_state.show_sliders

    # Show the sliders if the state is True
    if st.session_state.show_sliders:
        # Create sliders to adjust the offsets
        x_offset = st.slider("X offset", -200, 200, 0)
        y_offset = st.slider("Y offset", -200, 200, 0)
        st.session_state.x_offset = x_offset
        st.session_state.y_offset = y_offset
    else:
        st.session_state.pop("x_offset", None)
        st.session_state.pop("y_offset", None)

    # Get the width of the user's display
    display_width = get_monitors()[0].width

    while True:
        # Read the frames from the webcam
        ret, frame = cap.read()

        if ret:
            # Overlay the glasses on the frame
            frame, selected_glass_index = overlay_glasses_on_face(
                frame, glasses, selected_glass_index,
                st.session_state.get("x_offset", 0),
                st.session_state.get("y_offset", 0))

            # Display the output
            image_placeholder.image(frame, channels="BGR", width=1200)

            # Check for user input to quit
            key = cv2.waitKey(1) & 0xFF
            if key == ord('q'):
                break

        else:
            st.error("Failed to read frame from webcam.")
            break

if __name__ == "__main__":
    run()
