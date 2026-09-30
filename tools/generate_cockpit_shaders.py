"""Rebuild the five fixed-strength cutoff shaders using SDK DXC assembler/validator.
Usage: python tools/generate_cockpit_shaders.py PATH_TO_DXIL_ASSEMBLER [PATH_TO_DXCOMPILER_DLL]
"""
from pathlib import Path
import subprocess,sys,struct,re,hashlib,json,tempfile
root=Path(__file__).resolve().parents[1]/"src/mods/vr/cockpit_shaders"
assembler=Path(sys.argv[1]).resolve()
blobs=[]
with tempfile.TemporaryDirectory() as work:
    for sid in (47,50,51,52):
        template=(root/f"history{sid}-template.ll").read_text()
        for index,cutoff in enumerate((0.5,1.0,2.0,5.0,10.0)):
            ir=re.sub(r"(fcmp fast olt float %\d+, )1\.000000e\+00",lambda m:m[1]+f"{cutoff:.6e}",template)
            assert ir!=template or cutoff==1.0
            source=Path(work)/"shader.ll";source.write_text(ir)
            output=root/f"history{sid}-{index}.dxbc"
            subprocess.run([str(assembler),str(source),str(output),*sys.argv[2:]],check=True)
            blobs.append(output.read_bytes())
header=b"AFWHRNG1"+struct.pack("<I",len(blobs))
offset=12+len(blobs)*8;entries=[]
for blob in blobs:
    entries.append(struct.pack("<II",offset,len(blob)));offset+=len(blob)
(root/"AFWHistoryShaders.bin").write_bytes(header+b"".join(entries)+b"".join(blobs))
print("Rebuilt 20 validated shaders at fixed compensation strength 1")
