// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "health"
{
	Properties
	{
		_Cutoff( "Mask Clip Value", Float ) = 0.5
		_Health("Health", Range( 0 , 1)) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "TransparentCutout"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha noshadow 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform float _Health;
		uniform float _Cutoff = 0.5;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float4 lerpResult10 = lerp( float4(0.978,0.01438237,0.01438237,0) , float4(0.2044197,0.02157355,0.978,0) , _Health);
			o.Emission = lerpResult10.rgb;
			o.Alpha = 1;
			float2 uv_TexCoord25 = i.uv_texcoord * float2( 1,1 ) + float2( 0,0 );
			float2 temp_output_26_0 = (float2( -1,-1 ) + (uv_TexCoord25 - float2( 0,0 )) * (float2( 1,1 ) - float2( -1,-1 )) / (float2( 1,1 ) - float2( 0,0 )));
			float temp_output_27_0 = length( temp_output_26_0 );
			clip( ( floor( ( 0.3 + temp_output_27_0 ) ) * ( 1.0 - ceil( ( ( 1.0 - (0 + (atan2( temp_output_26_0.y , temp_output_26_0.x ) - -3.14159) * (1 - 0) / (3.14159 - -3.14159)) ) - _Health ) ) ) * ( 1.0 - floor( temp_output_27_0 ) ) ) - _Cutoff );
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15001
48;101;1909;904;999.6455;428.0271;1.373375;True;True
Node;AmplifyShaderEditor.TextureCoordinatesNode;25;-903.2436,213.323;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TFHCRemapNode;26;-678.042,211.2757;Float;True;5;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT2;1,1;False;3;FLOAT2;-1,-1;False;4;FLOAT2;1,1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.BreakToComponentsNode;37;-394.4506,178.5192;Float;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.ATan2OpNode;38;-169.5048,130.7832;Float;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;39;34.98486,125.5032;Float;True;5;0;FLOAT;0;False;1;FLOAT;-3.14159;False;2;FLOAT;3.14159;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;44;259.7388,155.6577;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;24;312.8413,46.3621;Float;False;Property;_Health;Health;1;0;Create;True;0;0;False;0;0;0.008;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LengthOpNode;27;-145.7478,532.6998;Float;True;1;0;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;32;-172.3625,391.4368;Float;False;Constant;_Float0;Float 0;1;0;Create;True;0;0;False;0;0.3;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;40;409.8169,89.83751;Float;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CeilOpNode;41;613.7946,96.62778;Float;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;31;38.50795,389.3895;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FloorOpNode;28;22.12963,538.8417;Float;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;9;-101.9891,-240.1148;Float;False;Constant;_Color1;Color 1;0;0;Create;True;0;0;False;0;0.2044197,0.02157355,0.978,0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;42;779.6251,96.6278;Float;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;23;-100.7074,-402.9099;Float;False;Constant;_Color0;Color 0;0;0;Create;True;0;0;False;0;0.978,0.01438237,0.01438237,0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;29;183.8652,540.8889;Float;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FloorOpNode;33;192.0544,342.3019;Float;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;36;926.8806,496.2505;Float;True;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;10;357.2447,-298.6591;Float;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;1049.411,-49.01226;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;health;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;0;False;0;Custom;0.5;True;False;0;True;TransparentCutout;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;0;Zero;Zero;0;Zero;Zero;OFF;OFF;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;0;-1;-1;-1;0;0;0;False;0;0;0;False;-1;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;26;0;25;0
WireConnection;37;0;26;0
WireConnection;38;0;37;1
WireConnection;38;1;37;0
WireConnection;39;0;38;0
WireConnection;44;0;39;0
WireConnection;27;0;26;0
WireConnection;40;0;44;0
WireConnection;40;1;24;0
WireConnection;41;0;40;0
WireConnection;31;0;32;0
WireConnection;31;1;27;0
WireConnection;28;0;27;0
WireConnection;42;0;41;0
WireConnection;29;0;28;0
WireConnection;33;0;31;0
WireConnection;36;0;33;0
WireConnection;36;1;42;0
WireConnection;36;2;29;0
WireConnection;10;0;23;0
WireConnection;10;1;9;0
WireConnection;10;2;24;0
WireConnection;0;2;10;0
WireConnection;0;10;36;0
ASEEND*/
//CHKSM=4DD0D83FF7005208C697C55BB33EEFED34A5BA25