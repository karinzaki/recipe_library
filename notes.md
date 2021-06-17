   <div class="footer">
      <form action="/recipe/<%= each_recipe["id"]%>" method="POST">
         <div class="popup" role="alert">
            <div class="popup-message">
               <p>Are you sure you want to delete this recipe?</p>
               <ul class="buttons">
                  <input type="hidden" id="delete" name="_method" value="DELETE">
                  <li id="delete"><a href="#0"><input type="submit" value="Yes"></input></a></li>
                  <li><a href="#0"><input type="submit" value="No"></input></a></li>
               </ul>
               <a href="#0" class="popup-close">Close</a>
            </div> 
         </div> 
      </form>
   </div>