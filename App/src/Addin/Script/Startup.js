var iframe = window.frameElement;

iframe.parentElement.style.display = 'flex';
iframe.parentElement.style.flexDirection = 'column';
iframe.parentElement.style.flexGrow = '1';

iframe.style.removeProperty('height');
iframe.style.removeProperty('min-height');
iframe.style.removeProperty('max-height');

iframe.style.height = '-webkit-fill-available';

var controlAddIn = document.getElementById('controlAddIn');

$(document).ready(function () {
    $navControlContainer = $("#controlAddIn");
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('ControlAddinLoaded', null);
});