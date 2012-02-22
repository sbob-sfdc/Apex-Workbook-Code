Set<String> s = new Set<String>{'a','b','c'}; 
// Because c is already a member, nothing will happen. 
s.add('c'); 
s.add('d'); 
if (s.contains('b')) {
    System.debug ('I contain b and have size ' + s.size());
}