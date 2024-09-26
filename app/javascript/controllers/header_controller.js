import { Controller } from "@hotwired/stimulus"
import {enter, leave, toggle} from 'el-transition'

export default class extends Controller {

  static targets = ['dropdown', 'OpenUserMenu']

  connect(){
    this.OpenUserMenuTarget.addEventListener("click", (e)=> {
      console.log("Header clicked");
      toggleDropdown(this.dropdownTarget)
    })
  }
}

// function openDropdown(element) {
//     enter(element).then(() => {
//         console.log("Enter transition complete")
//     })
// }
 
// function closeDropdown() {
//     leave(this.dropdownTarget).then(() => {
//         element.destroy();
//     })
// }
 
function toggleDropdown(element) {
    toggle(element);
}
