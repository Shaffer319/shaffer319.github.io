    <script id="vshader" type="x-shader/x-vertex">
        uniform mat4 u_modelViewProjMatrix;
        uniform mat4 u_normalMatrix;
        uniform vec3 lightDir;

        attribute vex3 vNormal;
        attribute vec4 vTextCoord;
        attribute vec4 vPosition;

        varying float v_Dot;
        varying vec2 v_texCoord;

        void main()
        {
            gl_Position = u_modelViewProjMatrix * vPosition;
            v_texCoord = vTextCoord.st;
            vec4 transNormal = u_normalMatrix * vec4(vNormal, 1);
            v_Dot = max(dot(transNormal.xyz, lightDir), 0.0);
        }
    </script>