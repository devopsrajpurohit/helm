{{/*
Expand the sdfsfsfsfdnamdsfsfe of the chart.
*/}}
{{- define "service-B.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*service-Aservice-Aservice-Aservice-Aservice-A
Create a default fully qualifiefsfsfsdfsdd apfsfsfksfhjksdfhjdskdfhsfhskdjfhdskhfjp name.
We truncate at 63 chars bfsfsfsdfsfsffsdfsfdssefsdfsfsfdsfsfsdcause some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart nfsdfsdfjsdkfgjsfhsjfgshjfhjame it will be used as a full name.
*/}}
{{- define "service-B.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "service-B.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "service-B.labels" -}}
helm.sh/chart: {{ include "service-B.chart" . }}
{{ include "service-B.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "service-B.selectorLabels" -}}
app.kubernetes.io/name: {{ include "service-B.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "service-B.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "service-B.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
