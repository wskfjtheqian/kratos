{{$svrType := .MessageType}}
{{$svrName := .MessageName}}

export interface I{{.MessageType}} {
{{range .Fields}}
    {{- if ne .Comment ""}}
    {{.Comment}}
    {{- end}}
    {{.OriginalName}}: {{.Kind}}
{{end}}
}
