<gifts>
    <div class="flex one">
        <div>
            <h1> Gifts Available</h1>
            <div class="flex three">
                <div>
                    <button class="mainButton">Cord Holders <span class="label success">{gifts['cordholders']}</span></button>
                </div>
                <div>
                    <button class="mainButton">T-Shirts <span class="label success">{gifts['t-shirts']}</span></button>
                </div>
                <div>
                    <button class="mainButton">Mugs <span class="label success">{gifts['mugs']}</span></button>
                </div>
            </div>
        </div>
    </div>
    <script>
    var self = this

    obs.on('quota_updated',function(gifts){
        self.gifts = gifts
        self.update()
        
    })



    
    </script>
</gifts>