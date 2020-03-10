# jupyter-notebook-datascience
A notebook to use data science packages such as numpy, pandas, scikit-learn, and matplotlib.

**Build**
sudo docker build -t jupyter-notebook-datascience .

**Run**
sudo docker run -p 8888:8888 -v /your-directory:/home/jovyan jupyter-notebook-datascience
