// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "1_Gradient"
{
	Properties
	{
		[Header(sinGradient)]
		_Speed("Speed", Range( 0 , 10)) = 0.8823529
		_Deform("Deform", Range( 0 , 1)) = 0.06
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows vertex:vertexDataFunc 
		struct Input
		{
			float3 worldPos;
		};

		uniform float _Speed;
		uniform float _Deform;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float mulTime8_g7 = _Time.y * 1;
			float3 ase_worldPos = mul( unity_ObjectToWorld, v.vertex );
			float3 clampResult1_g7 = clamp( sin( ( ( ( _Speed * mulTime8_g7 ) + ase_worldPos ) * ( 2 * UNITY_PI ) * 2 ) ) , float3( 0,0,0 ) , float3( 1,0,0 ) );
			float3 temp_output_32_0 = clampResult1_g7;
			float3 ase_worldNormal = UnityObjectToWorldNormal( v.normal );
			v.vertex.xyz += ( temp_output_32_0 * ase_worldNormal * _Deform );
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float mulTime8_g7 = _Time.y * 1;
			float3 ase_worldPos = i.worldPos;
			float3 clampResult1_g7 = clamp( sin( ( ( ( _Speed * mulTime8_g7 ) + ase_worldPos ) * ( 2 * UNITY_PI ) * 2 ) ) , float3( 0,0,0 ) , float3( 1,0,0 ) );
			float3 temp_output_32_0 = clampResult1_g7;
			float4 lerpResult8 = lerp( float4(1,0,0,0) , float4(0,1,0,0) , float4( temp_output_32_0 , 0.0 ));
			o.Emission = lerpResult8.rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15001
579;225;2009;904;845.4182;545.3561;1;True;True
Node;AmplifyShaderEditor.ColorNode;6;-314.1501,-484.1624;Float;False;Constant;_Color0;Color 0;1;0;Create;True;0;0;False;0;1,0,0,0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;7;-307.5626,-302.6984;Float;False;Constant;_Color1;Color 1;1;0;Create;True;0;0;False;0;0,1,0,0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;30;-25.20203,68.73578;Float;False;Property;_Deform;Deform;2;0;Create;False;0;0;False;0;0.06;0.06;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;28;6.798004,-93.26422;Float;False;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.FunctionNode;32;-305.1705,-119.5938;Float;True;sinGradient;0;;7;ee35c53b8fe864ce2b35e99f85b5c4df;0;1;7;FLOAT;2;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;8;-43.01691,-351.6159;Float;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;29;257.798,-98.26422;Float;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;431,-304;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;1_Gradient;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;0;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;Zero;Zero;0;Zero;Zero;OFF;OFF;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;0;0;False;0;0;0;False;-1;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;8;0;6;0
WireConnection;8;1;7;0
WireConnection;8;2;32;0
WireConnection;29;0;32;0
WireConnection;29;1;28;0
WireConnection;29;2;30;0
WireConnection;0;2;8;0
WireConnection;0;11;29;0
ASEEND*/
//CHKSM=2220B4473430F6E76EB03F51B9AE011A06D21934