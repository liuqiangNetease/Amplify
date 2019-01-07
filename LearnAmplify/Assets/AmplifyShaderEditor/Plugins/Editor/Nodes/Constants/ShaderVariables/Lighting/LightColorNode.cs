// Amplify Shader Editor - Visual Shader Editing Tool
// Copyright (c) Amplify Creations, Lda <info@amplify.pt>

using UnityEngine;

namespace AmplifyShaderEditor
{
	[System.Serializable]
	[NodeAttributes( "Light Color", "Light", "Light Color, RGB value already contains light intensity while A only contains light intensity" )]
	public sealed class LightColorNode : ShaderVariablesNode
	{
		private const string m_lightColorValue = "_LightColor0";
		protected override void CommonInit( int uniqueId )
		{
			base.CommonInit( uniqueId );
			ChangeOutputProperties( 0, "RGBA", WirePortDataType.COLOR );
			AddOutputPort( WirePortDataType.FLOAT3, "Color" );
			AddOutputPort( WirePortDataType.FLOAT, "Intensity" );
			m_previewShaderGUID = "43f5d3c033eb5044e9aeb40241358349";
		}

		public override void RenderNodePreview()
		{
			if( !m_initialized )
				return;

			int count = m_outputPorts.Count;
			for( int i = 0; i < count; i++ )
			{
				RenderTexture temp = RenderTexture.active;
				RenderTexture.active = m_outputPorts[ i ].OutputPreviewTexture;
				Graphics.Blit( null, m_outputPorts[ i ].OutputPreviewTexture, PreviewMaterial, i );
				RenderTexture.active = temp;
			}
		}

		public override string GenerateShaderForOutput( int outputId, ref MasterNodeDataCollector dataCollector, bool ignoreLocalvar )
		{
			if( dataCollector.IsTemplate && dataCollector.TemplateDataCollectorInstance.CurrentSRPType != TemplateSRPType.Lightweight )
				dataCollector.AddToIncludes( -1, Constants.UnityLightingLib );

			base.GenerateShaderForOutput( outputId, ref dataCollector, ignoreLocalvar );

			string finalVar = m_lightColorValue;
			if( dataCollector.IsTemplate && dataCollector.TemplateDataCollectorInstance.CurrentSRPType == TemplateSRPType.Lightweight )
				finalVar = "_MainLightColor";
			switch( outputId )
			{
				default:
				case 0: return finalVar;
				case 1: return finalVar + ".rgb";
				case 2: return finalVar + ".a";
			}
		}
	}
}
