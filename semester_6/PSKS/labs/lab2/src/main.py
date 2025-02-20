import numpy as np
import matplotlib.pyplot as plt
import scipy.special
import glob
import imageio.v3 as imageio


# Define the Neural Network class
class NeuralNetwork:
    def __init__(self, input_nodes, hidden_nodes, output_nodes, learning_rate):
        self.inodes = input_nodes
        self.hnodes = hidden_nodes
        self.onodes = output_nodes

        # Initialize weight matrices with random values
        self.wih = np.random.normal(0.0, pow(self.hnodes, -0.5), (self.hnodes, self.inodes))
        self.who = np.random.normal(0.0, pow(self.onodes, -0.5), (self.onodes, self.hnodes))

        self.lr = learning_rate
        self.activation_function = lambda x: scipy.special.expit(x)


    def train(self, inputs_list, targets_list):
        # Convert input and target lists to 2D arrays
        inputs = np.array(inputs_list, ndmin=2).T
        targets = np.array(targets_list, ndmin=2).T

        # Forward pass
        hidden_inputs = np.dot(self.wih, inputs)
        hidden_outputs = self.activation_function(hidden_inputs)

        final_inputs = np.dot(self.who, hidden_outputs)
        final_outputs = self.activation_function(final_inputs)

        # Compute errors
        output_errors = targets - final_outputs
        hidden_errors = np.dot(self.who.T, output_errors)

        # Backpropagation and weight update
        self.who += self.lr * np.dot((output_errors * final_outputs * (1.0 - final_outputs)), hidden_outputs.T)
        self.wih += self.lr * np.dot((hidden_errors * hidden_outputs * (1.0 - hidden_outputs)), inputs.T)


    def query(self, inputs_list):
        # Convert input list to 2D array
        inputs = np.array(inputs_list, ndmin=2).T
        hidden_inputs = np.dot(self.wih, inputs)
        hidden_outputs = self.activation_function(hidden_inputs)
        final_inputs = np.dot(self.who, hidden_outputs)
        final_outputs = self.activation_function(final_inputs)
        return final_outputs


def load_own_images(image_folder):
    own_dataset = []
    for image_file_name in glob.glob(f'{image_folder}/*.png'):
        label = int(
            image_file_name[-5:-4])  # Предполагается, что имя файла заканчивается на '_X.png', где X — метка
        print(f"[INFO] Loading image {image_file_name}")
        img_array = imageio.imread(image_file_name, mode='F')
        img_data = 255.0 - img_array.reshape(784)
        img_data = (img_data / 255.0 * 0.99) + 0.01
        record = np.append(label, img_data)
        own_dataset.append(record)
    return own_dataset


def test_own_images(neural_network, own_dataset):
    for item in own_dataset:
        correct_label = int(item[0])
        inputs = item[1:]
        outputs = neural_network.query(inputs)
        label = np.argmax(outputs)
        print(f"[INFO] Network prediction: {label}, Correct label: {correct_label}")
        plt.imshow(inputs.reshape(28, 28), cmap='Greys', interpolation='None')
        plt.show()
        if label == correct_label:
            print("Match!")
        else:
            print("No match!")


# Main function
def main():
    # Neural network hyperparameters for variant 6
    input_nodes = 784  # Number of input nodes (pixels in the image)
    hidden_nodes = 200  # Number of hidden nodes
    output_nodes = 10  # Number of output nodes (digits 0-9)
    learning_rate = 0.1  # Learning rate
    epochs = 10  # Number of training epochs

    # Create a neural network instance
    n = NeuralNetwork(input_nodes, hidden_nodes, output_nodes, learning_rate)

    print("[INFO] Loading training dataset...")

    # Load training dataset
    try:
        with open("mnist_train.csv", 'r') as training_data_file:
            training_data_list = training_data_file.readlines()
    except FileNotFoundError:
        print("[ERROR] mnist_train.csv not found!")
        return

    print("[INFO] Training the neural network...")

    # Train the neural network
    for e in range(epochs):
        print(f"[INFO] Epoch {e + 1}/{epochs} in progress...")
        for record in training_data_list:
            all_values = record.split(',')
            inputs = (np.asarray(all_values[1:], dtype=np.float32) / 255.0 * 0.99) + 0.01
            targets = np.zeros(output_nodes) + 0.01
            targets[int(all_values[0])] = 0.99
            n.train(inputs, targets)

    print("[INFO] Training completed!")

    print("[INFO] Loading test dataset...")

    # Load test dataset
    try:
        with open("mnist_test.csv", 'r') as test_data_file:
            test_data_list = test_data_file.readlines()
    except FileNotFoundError:
        print("[ERROR] mnist_test.csv not found!")
        return

    print("[INFO] Testing the neural network...")

    scorecard = []
    for record in test_data_list:
        all_values = record.split(',')
        correct_label = int(all_values[0])
        inputs = (np.asarray(all_values[1:], dtype=np.float32) / 255.0 * 0.99) + 0.01
        outputs = n.query(inputs)
        label = np.argmax(outputs)
        scorecard.append(1 if label == correct_label else 0)

    # Compute and print accuracy
    scorecard_array = np.asarray(scorecard)
    accuracy = scorecard_array.sum() / scorecard_array.size
    print(f"[INFO] Network accuracy = {accuracy:.4f}")

    print("[INFO] Loading and testing on own images...")
    own_images = load_own_images('my_own_images')
    test_own_images(n, own_images)
    print("[INFO] Program execution finished.")


if __name__ == "__main__":
    print("[INFO] Neural Network program started...")
    main()

