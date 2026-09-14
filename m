Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282A639B4A5
	for <linux-man@vger.kernel.org>; Mon, 14 Sep 2026 23:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789428831; cv=pass; b=L1NrPgg6iHlQCmWdNwqTyXldG2lB7LosmCL+SLBO7FKWyzWNftoYcDwYNPVoaT1zsABHXzvHM/CKwAIQsl0IJ33FZU2L1jpoqrf/b/OQF+5pzxs1Y/2/LJjn/ZqwI2Ww2Cnut6Z+k0opXMUfcn6IG2CuSK+vUsIPVpkfIuMM9+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789428831; c=relaxed/simple;
	bh=XxiyVCurDpLs6gXSr1N6NOajH5tev6m0fK8akbKqDUU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=gukjHrIrUnILh3W5hgmxJP7tVWpS00RHXXAj/SzPK8MB8vRQiJEs8eAJDazUpdM6XAC5bJM7zqgCqNRfFIcPZ4fOHh8Cocx2pwY8QX13i8kkNQwHFQWo9jAD5jqcpqTvRgCxr7ZWpWLSKV+qRMlO1vSjByuqPe0DtbVyTAa1Fg4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pressgrupdesk.com; spf=pass smtp.mailfrom=pressgrupdesk.com; dkim=pass (2048-bit key) header.d=pressgrupdesk.com header.i=@pressgrupdesk.com header.b=UsiBQo3k; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pressgrupdesk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pressgrupdesk.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pressgrupdesk.com header.i=@pressgrupdesk.com header.b="UsiBQo3k"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c29667ed561so487446266b.2
        for <linux-man@vger.kernel.org>; Mon, 14 Sep 2026 16:33:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789428827; cv=none;
        d=google.com; s=arc-20260327;
        b=ogO2+QPsyXIBGYyt1CPA4L2eER7A63LesB2mscuTSr/TSWzSj/B/xkQMQh6jGIriQ4
         1MxeAQKLIJKjkdV2IgzJ7D99jLJRdmg1cI6ivNiATRwlVYqkOLViRSCNrXlSRYxmmssD
         LEOakJoLjlCLDut/GqBtHXki00OEYe/XpOaTKdM9UCc1GEANmDGDg5Dk95huCUYec70j
         z+1HVPkj0erOc17hyNWZyWt1BxafXbU7uWsrstm11baJ5VzOUi9E9xugA/O1po/Ywak1
         Z6ckjtQaQ4dQ31GlzwW5HiuygwdG5G5uo26q053+MKH2pxYzqjOmMa5hDJ4LAYBPo5OJ
         epoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:sender:mime-version:dkim-signature;
        bh=XxiyVCurDpLs6gXSr1N6NOajH5tev6m0fK8akbKqDUU=;
        fh=OclAtLKJTQTIvPXBcbgjquIcuF1L0TED2I15vb2Dds8=;
        b=XjLBnkkrzEacGkE3G8lwuFi+kQul3h5yEVDtMpMKr9eq63MPf7uzTYZrSrVOdgVle/
         qH4G7y7FpsP3FFh29GV2Wmy3E8SPrMZR4oJVf8JbKI4oRDqo4b0A4ZfFzAOL2wvxPNEB
         1urDXWwF1aUPXbUvmP65+iengGBWhdOBLjxhJt5Mn9jCFSlvYqVvf9z0FFSNFWKPJuVh
         4GMsvXUKukPtwzxW1UTr3vbpAoNA2mpG/zF+uo62XjmcAoeiVIAxpsZnEVw/JsTH5Xf5
         eeYHP0UZFuHqR/eD9QuTaJ6h1kSiPJhK4STKRHGfKBADS0ok0gVnPVGvif7h/4d1TTdj
         ehYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pressgrupdesk.com; s=google; t=1789428827; x=1790033627; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:sender:mime-version
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XxiyVCurDpLs6gXSr1N6NOajH5tev6m0fK8akbKqDUU=;
        b=UsiBQo3kuLuWitm2Zmqz2WOb/eR3gWYu6H6JUwsvnWMPax7bMIMrUueCUAyR/e7YBE
         sKNbG3AohAGSrkwAroeg6+5NIrpbgT3niP+BQPDPt1Io3vjj6Md8X+0s8KIuWljBaH/I
         eVA85qxAAeJD3zYoQfoG/pbppaaRm0OcVqza/UX1WhIfAoCzWXAoKl0kdxxLA1Xrht1D
         Ss2SazyO96uNvHob675bBvgMBzx5xJr8aUEe+r32DRzlF7zBkq2pVzru75E5psNKFYEU
         6tkvoWSp1sHoHcmfdoCj4vmvCSOKvaNfNPJBR/XkQTcN2bfe/IN9oQ2HAmCfrbyBjTV/
         TWqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789428827; x=1790033627;
        h=content-type:to:subject:message-id:date:from:sender:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XxiyVCurDpLs6gXSr1N6NOajH5tev6m0fK8akbKqDUU=;
        b=QBWQ5UgrJPZ5vpdh7azbS1QXgOKzSsn11YNPxtD83zaAO4WSflhtT8zInJZu3Pd+nA
         y3j9PF7KJThzMrS8CY3mdVrjHh4dk5aVrnCfC96lXqeHNon9hNhWWesy3w7gRGaasA2Q
         kRCsaXOT0j+oaqagRpa650MayHMCrSX74/4zX7TVoOdP6gkBSfalTuzVTw8/hTOiIXTo
         0UXmaYm7f+QUKj6vWToilKNR2/Zs109Vw3YLzJe8dC6XF7MSy5JlTG72wdsVMDCOWWv7
         7bkDMR1LUxyBl/YYBTqsYkzz3VGPu5o8eUDhTtqfwjlNSDW67LhKYBO4kkgY2DpimsZ3
         oFfg==
X-Gm-Message-State: AFuF++myEnHCmoId9C99r7BBpd+J975msaGD/5MNQ+R0L+eQArPXKstR
	4MvOKO2vsP72HLgqLNRxwYxD0cantOLPTHSdY/Qqsp3zfmrb1zE4M2TbHjbnigu7WIxCjQTeqw1
	xd8YZ0/kNAYlgNY4TEyRHPctzWGh6AsQWquHimGs1A1I6DPbzEBlHGw==
X-Gm-Gg: AYBFou3gEIAjnZkBSDkwhuc/6lrnn0TGAJA6reHuc3jXtTxwQgsQKDKAI3mJdZpQz73
	W48mqQrnF3NSbf0EFpzniaLXg6a4CP+OqfSuk3mMRus0N3LRaUCau4ms/j9XDokGxkgW/eX2VeE
	zFdl9MhesiyhhD+GyylbM4U6KA0UKoWVzSh85VvTjP3B1ICngiBSA1KEP6ZtnGo0Y8cC4sHdTo5
	M4esdxs0ALTrJVm/HC65JiwwNo0YgNUxapavyKuXQ4ASbnyK/14qlQL9eztiU8ogDNcm+3F4+nu
	Wh/nLGwY/IiTHDOhT3S0FbwjEX2z5893hCN6PQA1utSliqRAABTg3Ak78k/Wj8v71XrPzxRUPXW
	cokcstfO8
X-Received: by 2002:a17:907:cd0d:b0:c29:41e1:c918 with SMTP id
 a640c23a62f3a-c29b85f7447mr302744966b.1.1789428827301; Mon, 14 Sep 2026
 16:33:47 -0700 (PDT)
Received: from 104313752547 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 14 Sep 2026 18:33:46 -0500
Received: from 104313752547 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 14 Sep 2026 18:33:46 -0500
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Sender: Manuscript Submission Desk <admissions@pressgrupdesk.com>
From: Manuscript Submission Desk <admissions@pressgrupdesk.com>
Date: Mon, 14 Sep 2026 18:33:46 -0500
X-Google-Sender-Auth: jKPc-cKLY0Ry8ms2nZXk56wINMk
X-Gm-Features: AcwNN1Xk1KrJDmDdnX8UbXh2sR_YWPMSBirkEsIgs04ukjFWF26mhFgWsJP-o1w
Message-ID: <CAF1wJJUJvjCE0eozUwOYWU-L3RBzo0Aj5dL6+eADGBYBkDWi+Q@mail.gmail.com>
Subject: Invitation for English Manuscript Submission
To: linux-man@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Dear Researcher,

We are currently welcoming English-language manuscript submissions
from researchers, academics, doctoral candidates and independent
scholars.

Authors working on original research articles, reviews, theoretical
papers and interdisciplinary studies are invited to submit their
manuscripts for consideration.

If you currently have a completed manuscript or research paper, we
would be pleased to invite you to review our submission information.

Further details and submission information will be provided through
our manuscript platform.

Kind regards,

Manuscript Submission Desk

If you do not wish to receive further invitations, simply reply UNSUBSCRIBE.
