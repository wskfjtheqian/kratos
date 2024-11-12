package main

import (
	"bytes"
	_ "embed"
	"sort"
	"strings"
	"text/template"
)

//go:embed ifaceTemplate.tpl
var httpTemplate string

type messagesDesc struct {
	MessageType string // Greeter
	MessageName string // helloworld.Greeter
	Metadata    string // api/helloworld/helloworld.proto
	Fields      []*fieldDesc
}

type fieldDesc struct {
	// field
	Name         string
	OriginalName string // The parsed original name
	Num          int
	Comment      string
	Kind         string
}

func (s *messagesDesc) execute() string {
	maps := make(map[string]*fieldDesc)
	keys := make([]string, 0)
	for _, m := range s.Fields {
		if _, ok := maps[m.Name]; !ok {
			maps[m.Name] = m
			keys = append(keys, m.Name)
		}

	}

	sort.Strings(keys)

	list := make([]*fieldDesc, 0)
	for _, key := range keys {
		list = append(list, maps[key])
	}
	s.Fields = list

	buf := new(bytes.Buffer)
	tmpl, err := template.New("iface").Parse(strings.TrimSpace(httpTemplate))
	if err != nil {
		panic(err)
	}
	if err := tmpl.Execute(buf, s); err != nil {
		panic(err)
	}
	return strings.Trim(buf.String(), "\r\n")
}
