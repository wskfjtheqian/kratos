{{$svrType := .MessageType}}
{{$svrName := .MessageName}}

export interface {{.MessageType}} {
{{range .Fields}}
    {{- if ne .Comment ""}}
    {{.Comment}}
    {{- end}}
    {{.OriginalName}}: {{.Kind}}
{{end}}
}
