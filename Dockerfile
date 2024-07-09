# Use the official Miniconda image as a parent image
FROM continuumio/miniconda3

# Set the working directory
WORKDIR /app

# Copy the environment.yml file into the container
COPY environment.yml /app/environment.yml

# Create the conda environment
RUN /opt/conda/bin/conda env create -f /app/environment.yml && \
    echo "source activate python_env" > ~/.bashrc

# Install Jupyter Notebook
RUN /opt/conda/bin/conda install -c conda-forge notebook --yes && \
    /opt/conda/bin/conda clean -afy

# Copy the current directory contents into the container
COPY . /app

# Make port 9999 available to the world outside this container
EXPOSE 9999

# Run Jupyter Notebook when the container launches
CMD [ "/bin/bash", "-c", "nohup jupyter notebook --ip=0.0.0.0 --port=9999 --no-browser --allow-root --NotebookApp.token='' > jupyter.log 2>&1 &" ]
