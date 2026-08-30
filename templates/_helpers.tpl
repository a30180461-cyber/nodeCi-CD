{{/*
Expand the name of the chart.
*/}}
{{- define "samplenode-app.name" -}}
samplenode-app
{{- end }}

{{/*
Create the service name.
*/}}
{{- define "samplenode-app.serviceName" -}}
samplenode-service
{{- end }}

{{/*
Common labels.
*/}}
{{- define "samplenode-app.labels" -}}
helm.sh/chart: {{ include "samplenode-app.chart" . }}
{{ include "samplenode-app.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels.
*/}}
{{- define "samplenode-app.selectorLabels" -}}
app.kubernetes.io/name: {{ include "samplenode-app.name" . }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "samplenode-app.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}