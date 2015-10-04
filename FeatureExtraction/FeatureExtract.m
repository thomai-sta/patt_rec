function ret_s = FeatureExtract(s)

ret_s = MoveCharacter(ScaleCharacter(RemovePenUp(Trim(s))));

end

