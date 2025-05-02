**Configuration**

Configuration is saved in **$HOME/.runpod/config.toml**

```sh
# Save API key
runpodctl config --apiKey $APIKEY
```

**Create pod**

- `--gpuType`: Prepend "NVIDIA GeForce" to the GPU names provided on the Runpod website

- `--imageName`: Accepts either link (or even relative path) to template description on Runpod's [Explore page](https://www.runpod.io/console/explore) (i.e. "runpod-torch-v240" for https://www.runpod.io/console/explore/runpod-torch-v240)

```sh
runpodctl create pod --gpuType 'NVIDIA GeForce RTX 3090' --imageName 'fedirz/faster-whisper-server:latest-cuda'
```

**Handle existing pod**

```sh
# Display running pods (output is similar to docker ps)
runpodctl get pod

runpodctl start pod $POD_ID
runpodctl stop pod $POD_ID
runpodctl remove pod $POD_ID
```

**Transfer files**

```sh title="Local"
# Output displays an alphanumeric codephrase
runpodctl send $FILE
```

```sh title="Destination pod"
runpod receive $CODEPHRASE
```

-   [Ultimate Runpod tutorial](https://www.youtube.com/watch?v=QN1vdGhjcRc)

-   [GitHub repo](https://github.com/runpod/runpodctl)

