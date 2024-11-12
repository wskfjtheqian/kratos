{{$svrType := .ServiceType}}
{{$svrName := .ServiceName}}
{{$fileName := .FileName}}

export interface I{{.ServiceType}}Client {
{{range .MethodSets}}
	{{- if ne .Comment ""}}
	{{.Comment}}
	{{- end}}
    {{.Name}}(req: {{$fileName}}.I{{.Name}}Request): Promise<axios.AxiosResponse<{{$fileName}}.I{{.Name}}Reply>>
{{end}}
}

export class {{.ServiceType}}Client implements I{{.ServiceType}}Client {
{{range .MethodSets}}
	{{- if ne .Comment ""}}
	{{.Comment}}
	{{- end}}
    {{.Name}}(req: {{$fileName}}.I{{.Name}}Request): Promise<axios.AxiosResponse<{{$fileName}}.I{{.Name}}Reply>> {
        return request({
            url: "{{.Path}}",
            method: "{{.Method}}",
        })
    }
{{end}}
}
