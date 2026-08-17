Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CDD430319
	for <linux-man@vger.kernel.org>; Mon, 17 Aug 2026 13:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786972668; cv=pass; b=ndbJleQOv5etNOwOFsG0Th1uXwncD16VyqsLxjs2tuIEoMWGW1Quy2DWHlAS2BNNAWGFryPvpZn9o95arUI2VuHND9qtgs4gv0No4vYeeu2H+KeuN8lMgKOS5ERQ9mxcO9Uoir3fsxpZ3GBm0e3c/rPQIBOjydcWZuimO0JBaB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786972668; c=relaxed/simple;
	bh=gvoy17DxHZHsJ536T/1pWurAj4mte7olx0dhYy/cL+k=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=fkz6clQdvGv3ypvbS7lvqux7EuR84BxL1r/UZj+VF7SHMc5ia2HG/A3gtDZkxh8Gov2i23q/G3VX6UvfevNTP/d7neoBT9dCnyxo1/P4m8B4Ee7Dv9TCFReFzOD3s+b4t8MAPht3LF0G0dTglZFLBIyjwtrS127pe4UM+v9gSmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=parenting-central.com; spf=pass smtp.mailfrom=parenting-central.com; dkim=pass (2048-bit key) header.d=parenting-central-com.20251104.gappssmtp.com header.i=@parenting-central-com.20251104.gappssmtp.com header.b=xOyxx9VA; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=parenting-central.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=parenting-central.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=parenting-central-com.20251104.gappssmtp.com header.i=@parenting-central-com.20251104.gappssmtp.com header.b="xOyxx9VA"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso5067626a91.1
        for <linux-man@vger.kernel.org>; Mon, 17 Aug 2026 06:17:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786972666; cv=none;
        d=google.com; s=arc-20260327;
        b=b2Vvg0jao0aTn9IWNqsfINcg5ZflP6y8VpSuiG7OlLUv9SJRYGpp60w+7NpIBvl/tv
         JRElUxgvQBH5tOD4DQ18o/VgzCuMrOj3/YmSj1AScJdFwz8FQjWFtB7TkubH2CgTNE81
         h8vBpqeaZW0HLKZ4qCF17hymVXj7z5Eq2+B9cw+7MI77Xmb4W4ExcftYLoF2Ib2P9XTA
         GGZEguIer/tpn3GpwBiTctTo5wHg5f8YwiGyD3phhffcHhFmbQGZ/we7Ycy08cryLfkS
         wQtAZuK/e+lW7UfRlpHlj1U6o0gaaLnkB9Jj56diQ11qesWAONWt/4deVsO0JR8vC6oL
         LJpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=gvoy17DxHZHsJ536T/1pWurAj4mte7olx0dhYy/cL+k=;
        fh=OclAtLKJTQTIvPXBcbgjquIcuF1L0TED2I15vb2Dds8=;
        b=kLoPxhRVjWKfSGC8ozlkRCi6JHk/AuutkImdgr5nJrCtJjS0+sSwCrTGR54lpSRBuC
         n+m+sO+x56hvuZLocp02kqDu0OgZIwnSJlKqi8ECJ/ODqBfue9TsLKpg5qTo2MouSrSk
         zi0Ii7N8mMTIuuErhyvEF1ugdvj6KFJdM/COzJyuy5lpalNkYlmWxENYq4g9HkKrLcmN
         i/cQH2osgCQ3kAyZOhwxjDCt1YtUTaekUAgWwEIsURMYsnO+XBrhzUV/Gye7ZPwvaqnc
         yd3anYhAYBWEuTi1WhAlZXVFC0isvooaWSI59vQZjhuAkkjHwAopEVOBFgLsaLSwLweD
         E9JA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=parenting-central-com.20251104.gappssmtp.com; s=20251104; t=1786972666; x=1787577466; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gvoy17DxHZHsJ536T/1pWurAj4mte7olx0dhYy/cL+k=;
        b=xOyxx9VAAadhqwlTo5eoxAz0rRkYI2d6PGUJ5TtRYR4dToJljS5scu9cv1a+qS6MMU
         YG/BxM4SWQaLCozrbrkAqncYFBIysQAlvOKT6nLeU0yDvHbMNLiasYRaC+f2oTZPx4xx
         0/rNXzI1bSWpucyPaekTQNpFAoNwm9WQl2eDiNCcPydOgldBTMGFi4Bj4Me/ATmEUB51
         QqNdr8pgRYQa+coueOQ+3v9xw1GRpks557M/qcKkAa/GpwiEjKu9+FxNbbeQZHUCMy5j
         4O6exyMcPTCQntGplqDMUzibpKD5wdQCr/YCUwZPNxXQ7R5p4lfJ72mfaBDv22Qtk85j
         2xiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786972666; x=1787577466;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gvoy17DxHZHsJ536T/1pWurAj4mte7olx0dhYy/cL+k=;
        b=nLyPtSpDau/TWxeV6ZH1uGo9J39QuzBQwomhNBoaD8t81VFJCLNXZSOY3jKHk92dMW
         8FqguWt876dbm9lDsI3EpDn30Thmgz2HDxOeiwzRzwXfxFmEu9jXzHzIDKMBtU0qMtG8
         LJ48yUlJxrc41+8+jpjQ/7gynHWKLtP6CWAuNf8iHKmTNDb2E5H3WEwrmYjYUfUecQ+U
         eMMwTQOl2SDAHsNxSWBrzdcRy28VQtkDZUAsK5Rm6ZErSMS/ajKI4WlxB4p0EyKgUZaZ
         hPTxUBK6Vc9dAtnDRZJav9hDVv82FAWZhnGL2RO8CGhFTLJ8s8uA4s7cIiqakUL9mYyD
         HMLg==
X-Gm-Message-State: AOJu0YyVmeRIGQLyfZrPDKzEk+IC4IqD3DPzjAsOqhSUsen+zfNsrIZH
	ttbjovf+v8yDySFq4EbO+S/gNLY+fwpEjQOw76j+j0ViNFhlROto2onK8VWsNhzJyyfpyCjYWYB
	ajzBpgLI2UNCcO8eYF8DF9IceJ8MizfdZMrZ3relePUAHi7BqLL3W
X-Gm-Gg: AR+sD10idFuot1jUKJjvK6sxlrlnjqBLiAr+tmwj7SOO8YkttK33j8tqzbGZ1oVRtlD
	q3+EzbMB7nsVcNwjwiPuw5nPWUBBOIOudorsgI4x53K8UbnmkH4AdEGGPgDQlSF8LBL0Fhpwjwg
	gGtPVqgJrhM06z4J4Ndnm1ETfvcmI96zMjONV2HFK1+qNEWwgfYRhs63OsPVSARsJJ4rJf4kQjc
	tQV496MOv3vh/23SjpcmGr55yHrzEFIm1hNGPt+o+NfuP3KLwaK8JRH4VBV/vKRVcogDC7x13w3
	vK1bALGnRef+P/WAPnywOZ2rr9gWAkklxKglULihYg==
X-Received: by 2002:a17:90b:48ce:b0:390:b41a:b92b with SMTP id
 98e67ed59e1d1-3933b6d05c3mr27871113a91.4.1786972666599; Mon, 17 Aug 2026
 06:17:46 -0700 (PDT)
Received: from 1001290214511 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 17 Aug 2026 13:17:45 +0000
Received: from 1001290214511 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 17 Aug 2026 13:17:45 +0000
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Cassidy Gibson-Cooper <cassidy@parenting-central.com>
Date: Mon, 17 Aug 2026 13:17:45 +0000
X-Gm-Features: AcwNN1WhHOYq8UX9MZw7EOJ8F0XVNEYzyodAEDZchD0J9EXy-j21D9nbZmIBTn0
Message-ID: <CAKqLQ67Z6s+Ugf=tApQSqDrnbhFNtQHZhiwGHrJ9KP95kQ32HQ@mail.gmail.com>
Subject: Checking in on our article offer
To: linux-man@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I wanted to follow up on our previous email about providing an article
for your website on relocating with children. We believe it could be a
valuable resource for your audience and would love the opportunity to
contribute.

If you already responded, thanks for that and sorry for the repeat.

Best,
Cassidy and Tim Gibson-Cooper
