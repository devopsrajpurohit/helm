{{/*
Expand the name of the chart.fsdfsfs
*/}}
{{- define "service-A.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default ffdsfsffdsfsdfsdsfsdfsffsfsfsfssssfssfsfsfsfsfsdfsfsfsfsfsfsully qualified app name.
We trufsfsfsfsfsncate at 63fsfsffsdfsfsfsfsfsfssfgffgfggfsfsfsvxvxvxvxvxvxfsfsd fsfsfsffschars because sfsjfskdfksfjksdfhjksdfhjksome Kubernetes name fields are limited to this (by the DNS naming spec).
If release namefdsfsddfsdfsfsfdsfsfsffsfsdfsfssdfsdfsfsfsfsdf contains chart name it will be used as a full name.
*/}}
{{- define "service-A.fullname" -}}
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
{{- define "service-A.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "service-A.labels" -}}
helm.sh/chart: {{ include "service-A.chart" . }}
{{ include "service-A.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "service-A.selectorLabels" -}}
app.kubernetes.io/name: {{ include "service-A.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "service-A.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "service-A.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
