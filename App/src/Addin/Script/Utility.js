/**
 * Enter Element Id
 * @param {Text} textID 
 */
 function deleteID(textID) {
    while (document.getElementById(textID) != null) {
        var ax = document.getElementById(textID);
        ax.parentNode.removeChild(ax);
    }
}
