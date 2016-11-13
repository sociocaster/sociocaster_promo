<participants>
    <div class="flex one">
        <div>
            <h1> Participants</h1>
            <div class="flex one">
                <table class="primary">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th> Profile</th>
                            <th>Gift</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr each={value , key in participants}>
                            <td>
                                <img src="https://graph.facebook.com/{value.fbid}/picture?width=50&height=50"> {value.name}
                            </td>
                            <td><a href="{value.profile}" target="_blank"> {value.profile}</a></td>
                            <td>
                                <span if={value.gift=='cordholders' }> 1 Cord Holder</span>
                                <span if={value.gift=='t-shirts' }>1 T-Shirt Sociocaster</span>
                                <span if={value.gift=='mugs' }>1 Mug Sociocaster</span>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <script>
    var self = this
     var self = this

    obs.on('participants_updated',function(participants){
        self.participants = participants
        self.update()
        
    })



    
    </script>
</participants>