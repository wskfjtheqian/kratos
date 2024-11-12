{{$svrType := .ServiceType}}
{{$svrName := .ServiceName}}

export interface I{{.ServiceType}}Client {
{{range .MethodSets}}
	{{- if ne .Comment ""}}
	{{.Comment}}
	{{- end}}
    {{.Name}}(req: {{.Name}}Request): Promise<axios.AxiosResponse<{{.Name}}Reply>>
{{end}}
}

export class {{.ServiceType}}Client implements I{{.ServiceType}}Client {
{{range .MethodSets}}
	{{- if ne .Comment ""}}
	{{.Comment}}
	{{- end}}
    {{.Name}}(req: {{.Name}}Request): Promise<axios.AxiosResponse<{{.Name}}Reply>> {
        return request({
            url: "{{.Path}}",
            method: "{{.Method}}",
        })
    }
{{end}}
}
