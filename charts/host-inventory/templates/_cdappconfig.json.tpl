{{- define "cdappconfig.json" }}{"database":{"adminPassword":"{{ .Values.db.adminPassword | b64enc }}","adminUsername":"{{ .Values.db.adminUsername | b64enc }}","hostname":"{{ .Values.db.hostname }}","name":"{{ .Values.db.name | b64enc }}","password":"{{ .Values.db.password | b64enc }}","port":{{ .Values.db.port }},"sslMode":"disable","username":"{{ .Values.db.username | b64enc }}"},"endpoints":[{"apiPath":"/api/inventory/","app":"host-inventory","hostname":"{{ .Values.inventoryService.hostname }}","name":"service","port":8000,"tlsPort":0},{"apiPath":"/api/rbac/","app":"rbac","hostname":"{{ .Values.rbac.hostname }}","name":"service","port":8000,"tlsPort":0},{"apiPath":"/api/ingress/","app":"ingress","hostname":"{{ .Values.ingressService.hostname }}","name":"service","port":8000,"tlsPort":0}],"featureFlags":{"clientAccessToken":"{{ .Values.featureFlags.clientAccessToken }}","hostname":"{{ .Values.featureFlags.hostname }}","port":4242,"scheme":"http"},"hashCache":"e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855","kafka":{"brokers":[{"hostname":"{{ .Values.kafka.hostname }}","port":9092}],"topics":[{"name":"platform.inventory.system-profile","requestedName":"platform.inventory.system-profile"},{"name":"platform.payload-status","requestedName":"platform.payload-status"},{"name":"platform.inventory.events","requestedName":"platform.inventory.events"},{"name":"platform.notifications.ingress","requestedName":"platform.notifications.ingress"},{"name":"platform.inventory.host-ingress","requestedName":"platform.inventory.host-ingress"},{"name":"platform.inventory.host-ingress-p1","requestedName":"platform.inventory.host-ingress-p1"}]},"logging":{"cloudwatch":{"accessKeyId":"","logGroup":"","region":"","secretAccessKey":""},"type":"null"},"metadata":{"deployments":[{"image":"{{ .Values.images.insightsInventory }}","name":"service"},{"image":"{{ .Values.images.insightsInventory }}","name":"mq-pmin"},{"image":"{{ .Values.images.insightsInventory }}","name":"mq-p1"},{"image":"{{ .Values.images.insightsInventory }}","name":"mq-sp"}],"envName":"env-demo","name":"host-inventory"},"metricsPath":"/metrics","metricsPort":9000,"privateEndpoints":[{"app":"xjoin-search","hostname":"{{ .Values.xjoin.hostname }}","name":"api","port":10000,"tlsPort":0}],"privatePort":10000,"publicPort":8000,"webPort":8000}{{- end }}