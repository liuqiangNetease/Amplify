// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "healthBar"
{
	Properties
	{
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_TexCoord1 = i.uv_texcoord * float2( 1,1 ) + float2( 0,0 );
			float2 temp_output_17_0 = ( uv_TexCoord1 - float2( 0.5,0.5 ) );
			float temp_output_4_0 = atan2( temp_output_17_0.y , temp_output_17_0.x );
			float4 lerpResult10 = lerp( float4(0.972,0,0,0) , float4(0.2044197,0.02157355,0.978,0) , (0 + (temp_output_4_0 - -1.57) * (1 - 0) / (1.57 - -1.57)));
			o.Emission = lerpResult10.rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15001
14;45;1909;904;1142.553;532.1235;1.301931;True;True
Node;AmplifyShaderEditor.TextureCoordinatesNode;1;-733.9835,-170.3475;Float;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;17;-443.4161,-331.6261;Float;True;2;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.BreakToComponentsNode;7;-183,126;Float;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.ATan2OpNode;4;57.90579,119.4155;Float;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;11;416,-34;Float;True;5;0;FLOAT;0;False;1;FLOAT;-1.57;False;2;FLOAT;1.57;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;9;29,-265;Float;False;Constant;_Color1;Color 1;0;0;Create;True;0;0;False;0;0.2044197,0.02157355,0.978,0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;8;37,-432;Float;False;Constant;_Color0;Color 0;0;0;Create;True;0;0;False;0;0.972,0,0,0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ATanOpNode;14;-289.7881,388.3417;Float;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;12;329,235;Float;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;13;41,382;Float;False;Constant;_Float0;Float 0;0;0;Create;True;0;0;False;0;-2.99;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;10;341,-259;Float;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LengthOpNode;3;-29,-98;Float;True;1;0;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;672,-17;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;healthBar;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;0;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;Zero;Zero;0;Zero;Zero;OFF;OFF;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;0;0;False;0;0;0;False;-1;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;17;0;1;0
WireConnection;7;0;17;0
WireConnection;4;0;7;1
WireConnection;4;1;7;0
WireConnection;11;0;4;0
WireConnection;12;0;4;0
WireConnection;12;1;13;0
WireConnection;10;0;8;0
WireConnection;10;1;9;0
WireConnection;10;2;11;0
WireConnection;3;0;17;0
WireConnection;0;2;10;0
ASEEND*/
//CHKSM=0C0CBEE32A0A54F72C8F43748948471C9EE92495