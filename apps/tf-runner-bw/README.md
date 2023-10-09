# tf-runner-bw

This container is a custom [tf-runner](https://weaveworks.github.io/tf-controller/use_tf_controller/to_provision_resources_with_customized_Runner_Pods/#customize-runner-pod-image) for [tf-controller](https://github.com/weaveworks/tf-controller).

It adds the bitwarden CLI to the image.

The version of the container is the combination of the different versions:

* tf-runner version
* terraform version
* bw version
