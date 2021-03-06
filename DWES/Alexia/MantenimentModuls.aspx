﻿<%@ Page Title="Manteniments Moduls Professionals" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MantenimentModuls.aspx.cs" Inherits="MantenimentModuls" enableEventValidation="false" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
    <asp:Panel ID="Panel1" runat="server" CssClass="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">
                <asp:Button ID="ButtonNou" CssClass="btn btn-primary" runat="server" Text="Nou" />
                <asp:ModalPopupExtender ID="ButtonNou_ModalPopupExtender" runat="server" Enabled="True" TargetControlID="ButtonNou" PopupControlID="PanelModalCrear">
                </asp:ModalPopupExtender>
            </h3>
        </div>
        <div class="panel-body">
            <asp:Panel ID="PanelMantenimentModuls" runat="server" CssClass="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Mòduls Professionals</h3>
                </div>
                <div class="panel-body">
                    <div class="text-center">
                        <asp:Label ID="LabelCicle" runat="server" Text="Cicle"></asp:Label>
                        <asp:DropDownList ID="DropDownListCicles" runat="server" CssClass="form-control" AutoPostBack="True" DataSourceID="EntityDataSourceCicle" DataTextField="nom" DataValueField="id" OnSelectedIndexChanged="DropDownListCicles_SelectedIndexChanged"></asp:DropDownList>
                        <br />
                        <br />
                        <asp:GridView ID="GridViewModuls" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="EntityDataSourceModulsProf" Width="100%" OnSelectedIndexChanged="GridViewModuls_SelectedIndexChanged" OnRowDeleted="GridViewModuls_RowDeleted">
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Eliminar"></asp:LinkButton>
                                        <asp:ConfirmButtonExtender ID="LinkButton2_ConfirmButtonExtender" runat="server" ConfirmText="" DisplayModalPopupID="LinkButton2_ModalPopupExtender" Enabled="True" TargetControlID="LinkButton2">
                                        </asp:ConfirmButtonExtender>
                                        <asp:ModalPopupExtender ID="LinkButton2_ModalPopupExtender" runat="server" CancelControlID="btnCerrarEsborrar" Enabled="True" OkControlID="btnAceptarEsborrar" PopupControlID="PanelModalEsborrar" TargetControlID="LinkButton2">
                                        </asp:ModalPopupExtender>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" Text="Seleccionar"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Curs" SortExpression="id_curs">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("id_curs") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="LabelCodiGrid" runat="server" Text='<%# Eval("cursos.codi") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="id" HeaderStyle-CssClass="HideCell" ItemStyle-CssClass="HideCell" HeaderText="id" ReadOnly="True" SortExpression="id" >
                                <HeaderStyle CssClass="HideCell" />
                                <ItemStyle CssClass="HideCell" />
                                </asp:BoundField>
                                <asp:BoundField DataField="codi" HeaderText="Codi" SortExpression="codi" />
                                <asp:BoundField DataField="nom" HeaderText="Nom del módul" SortExpression="nom" />
                                <asp:BoundField DataField="hores" HeaderStyle-CssClass="HideCell" ItemStyle-CssClass="HideCell"  HeaderText="Hores" SortExpression="hores">
                                <HeaderStyle CssClass="HideCell" />
                                <ItemStyle CssClass="HideCell" />
                                </asp:BoundField>
                                <asp:BoundField DataField="hores_lliures" HeaderStyle-CssClass="HideCell" ItemStyle-CssClass="HideCell" HeaderText="Hores lliures" SortExpression="hores_lliures" >
                                <HeaderStyle CssClass="HideCell" />
                                <ItemStyle CssClass="HideCell" />
                                </asp:BoundField>
                                <asp:BoundField DataField="id_professor" HeaderStyle-CssClass="HideCell" ItemStyle-CssClass="HideCell" HeaderText="Profesor" SortExpression="id_professor" >
                                <HeaderStyle CssClass="HideCell" />
                                <ItemStyle CssClass="HideCell" />
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                        <br />
                        <asp:Label ID="LabelMensajeGridError" runat="server" CssClass="error"></asp:Label>
                    </div>
                  </div>
                </asp:Panel>

            <asp:Panel ID="PanelModalEsborrar" runat="server" CssClass="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Esborrar</h3>
                </div>
                <div class="panel-body">
                    <p class="text-center">Estàs segur de que vols esborrar el registre?</p>
                    <div class="row">
                        <div class="col-lg-1 col-centered">
                            <asp:Button ID="btnCerrarEsborrar" runat="server" CssClass="btn btn-danger" Text="Cancel·lar" />
                            <asp:Button ID="btnAceptarEsborrar" runat="server" CssClass="btn btn-success" Text="Aceptar"/>
                        </div>
                     </div>
                </div>
            </asp:Panel>
            <asp:Panel ID="PanelModalCrear" runat="server" CssClass="panel panel-primary">
                <div class="panel-heading">
                    <h3 id="titol_crear" class="panel-title"><asp:Label ID="LabelTitolModal" runat="server" Text="Crear"></asp:Label></h3>
                </div>
                <div class="panel-body">
                    <asp:Label ID="LabelCicleModal" runat="server" Text="Cicle"></asp:Label>
                    <br />
                    <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server">
                    </asp:DropDownList>
                    <asp:CascadingDropDown ID="DropDownList2_CascadingDropDown" runat="server" Category="padreCicle" Enabled="True" ServiceMethod="GetDropDownContents" TargetControlID="DropDownList2" UseContextKey="True">
                    </asp:CascadingDropDown>
                    <br />
                    <asp:Label ID="LabelCursModal" runat="server" Text="Curs"></asp:Label>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorCurs" runat="server" ControlToValidate="DropDownList1" CssClass="error" ErrorMessage="Curs obligatori" ValidationGroup="popup"></asp:RequiredFieldValidator>
                    <br />
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                    </asp:DropDownList>
                    <asp:CascadingDropDown ID="DropDownList1_CascadingDropDown" runat="server" Category="hijoCicle" EmptyText="No existeixen cursos" Enabled="True" LoadingText="Carregant" ParentControlID="DropDownList2" ServiceMethod="GetDropDownContents2" TargetControlID="DropDownList1" UseContextKey="True">
                    </asp:CascadingDropDown>
                    <br />
                    <asp:Label ID="LabelModalCodi" runat="server" Text="Codi"></asp:Label>
                    <asp:TextBox ID="TextBoxModalCodi" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxModalCodi" CssClass="error" ErrorMessage="Codi obligatori" ValidationGroup="popup"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Label ID="LabelModalNom" runat="server" Text="Nom"></asp:Label>
                    <asp:TextBox ID="TextBoxModalNom" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorNom" runat="server" ControlToValidate="TextBoxModalNom" CssClass="error" ErrorMessage="Camp obligatori" ValidationGroup="popup"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Label ID="LabelModalHores" runat="server" Text="Hores"></asp:Label>
                    &nbsp;<asp:CompareValidator ID="CompareValidatorHores" runat="server" ControlToValidate="TextBoxModalHores" CssClass="error" ErrorMessage="Introdueix un número" Operator="DataTypeCheck" Type="Integer" ValidationGroup="popup"></asp:CompareValidator>
                    <asp:TextBox ID="TextBoxModalHores" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorHores" runat="server" ControlToValidate="TextBoxModalHores" CssClass="error" ErrorMessage="Camp obligatori" ValidationGroup="popup"></asp:RequiredFieldValidator>
                    &nbsp;<br />&nbsp;<asp:Label ID="LabelModalHoresLliures" runat="server" Text="Hores lliure elecció"></asp:Label>
                    &nbsp;<asp:CompareValidator ID="CompareValidatorHoresLliures" runat="server" ControlToValidate="TextBoxModalHoresLliures" CssClass="error" ErrorMessage="Introdueix un número" Operator="DataTypeCheck" Type="Integer" ValidationGroup="popup"></asp:CompareValidator>
                    <asp:TextBox ID="TextBoxModalHoresLliures" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorHores_lliures" runat="server" ControlToValidate="TextBoxModalHoresLliures" CssClass="error" ErrorMessage="Camp obligatori" ValidationGroup="popup"></asp:RequiredFieldValidator>
                    &nbsp;<br />
                    <asp:Label ID="LabelModalProfesor" runat="server" Text="Profesor"></asp:Label>
                    <br />
                    <asp:DropDownList ID="DropDownListProfesor" CssClass="form-control" runat="server" DataSourceID="EntityDataSourceProfessor" DataTextField="nom" DataValueField="id">
                    </asp:DropDownList>
                    <asp:Label ID="LabelErrorBD" runat="server" CssClass="error"></asp:Label>
                    <br />
                    <asp:Label ID="LabelIdModificar" runat="server" Visible="False"></asp:Label>
                    <br />
                    <br />
                    <asp:Button ID="btnCerrarCrear" runat="server" CssClass="btn btn-danger" Text="Cancel·lar" CausesValidation="False" OnClick="btnCerrarCrear_Click" />
                    <asp:Button ID="btnAceptarCrear" runat="server" CssClass="btn btn-success" Text="Aceptar" OnClick="btnAceptarCrear_Click" ValidationGroup="popup" />
                </div>
            </asp:Panel>
            <!-- ModalPopupExtender -->
        </div>  
        <asp:EntityDataSource ID="EntityDataSourceCursos" runat="server" ConnectionString="name=alexiaEntities" DefaultContainerName="alexiaEntities" EnableFlattening="False" EntitySetName="cursos" EntityTypeFilter="cursos"></asp:EntityDataSource>

        <asp:EntityDataSource ID="EntityDataSourceCicle" runat="server" ConnectionString="name=alexiaEntities" DefaultContainerName="alexiaEntities" EnableFlattening="False" EntitySetName="cicles" EntityTypeFilter="cicles">
        </asp:EntityDataSource>

        <asp:EntityDataSource ID="EntityDataSourceModulsProf" runat="server" ConnectionString="name=alexiaEntities" DefaultContainerName="alexiaEntities" EnableDelete="True" EnableFlattening="False" EnableUpdate="True" EntitySetName="moduls_prof" EntityTypeFilter="moduls_prof" Include="cursos">
        </asp:EntityDataSource>
        <asp:HiddenField ID="HiddenField1" runat="server" />
        <asp:ModalPopupExtender ID="HiddenField1_ModalPopupExtender" runat="server" Enabled="True" PopupControlID="PanelModalEsborrar" TargetControlID="HiddenField1">
        </asp:ModalPopupExtender>
        <asp:EntityDataSource ID="EntityDataSourceProfessor" runat="server" ConnectionString="name=alexiaEntities" DefaultContainerName="alexiaEntities" EnableFlattening="False" EntitySetName="professors" EntityTypeFilter="professors">
        </asp:EntityDataSource>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" Runat="Server">
</asp:Content>

