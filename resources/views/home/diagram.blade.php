@extends('layouts/app')

@section('content')
 <div class="container bootstrap snippet" style="margin-top: 5%;">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-content">
                     <h1 class="text-center">Search Hadits</h1>
                    <div class="search-form">
                        <form role="form" action="{{ url('search') }}">
                            <div class="input-group">
                                <input type="text" placeholder="Search" name="search" class="form-control input-lg">
                                <div class="input-group-btn">
                                     <button class="btn btn-md btn-primary" type="submit"><span class="glyphicon glyphicon-search" aria-hidden="true"><span style="margin-left:10px;">Search</span></button>
                                </div>
                            </div>
                        </form>
                    </div>
                  </div>
                </div>
            </div>
        </div>
    </div>
    <br>
 <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb">    
              <li class="breadcrumb-item active" aria-current="page"><a href="{{ url ('similarity') }}">Similarity</a></li>
              <li class="breadcrumb-item"><a href="{{ url('table') }}">Result</a></li>
              <li class="breadcrumb-item active" aria-current="page"><a href="{{ url('diagram') }}">Diagram</a></li>
            </ol>
          </nav>          
        </div>
      </div>
    </div>
    <br>
 <div class="container bootstrap snippet">
    <div class="row">
        <div class="col-lg-12">
        	<?php

	        	$dataPoints1 = array(
				array("label"=> "Recall", "y"=> $recall_cosine ),
				array("label"=> "Precision", "y"=> $precision_cosine),
				array("label"=> "Similarity", "y"=>$averageCosine),
                array("label"=> "Waktu Eksekusi", "y"=> $time_cos)
				
				);
				$dataPoints2 = array(
				array("label"=> "Recall", "y"=> $recall_jaccard),
				array("label"=> "Precision", "y"=> $precision_jaccard),
                array("label"=> "Similarity", "y"=>$averageJaccard),
				array("label"=> "Waktu Eksekusi", "y"=> $time_jac)
				);
			
			?>

<script>
window.onload = function () {
 
var chart = new CanvasJS.Chart("chartContainer", {
    animationEnabled: true,
    theme: "light2",
    title:{
        text: "Perbandingan Cosine Similarity dan Jaccard Similarity"
    },
    legend:{
        cursor: "pointer",
        verticalAlign: "center",
        horizontalAlign: "right",
        itemclick: toggleDataSeries
    },
    data: [{
        type: "column",
        name: "Cosine Similarity",
        indexLabel: "{y}",
        yValueFormatString: "#0.##",
        showInLegend: true,
        dataPoints: <?php echo json_encode($dataPoints1, JSON_NUMERIC_CHECK); ?>
    },{
        type: "column",
        name: "Jaccard Similarity",
        indexLabel: "{y}",
        yValueFormatString: "#0.##",
        showInLegend: true,
        dataPoints: <?php echo json_encode($dataPoints2, JSON_NUMERIC_CHECK); ?>
    }]
});
chart.render();
 
function toggleDataSeries(e){
    if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
        e.dataSeries.visible = false;
    }
    else{
        e.dataSeries.visible = true;
    }
    chart.render();
}
 
}
</script>
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
        </div>
    </div>
</div>
@endsection