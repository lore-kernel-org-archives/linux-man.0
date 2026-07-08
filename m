Received: from a3.inai.de (a3.inai.de [144.76.212.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FE629B764
	for <linux-man@vger.kernel.org>; Wed,  8 Jul 2026 19:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.76.212.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783537387; cv=none; b=pqOB9R6Zm3Djn4IvltXFTl4qT24rbTbSPGAfxqDIhF0Slt5wNPVcet6XzciWKITX4hHxZCn6u9szprQzm7DFNBjbvf0xUp2MlIp2jrmUY1kf1J15p2PQhN7UC98717qL3/zxjobBfTihMq5MT8fNGar1Uulux3rQKzbBBHiAges=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783537387; c=relaxed/simple;
	bh=ODRmeJwoHTvpE0J1RgkxUPELDPfYQLgo/o478J+Sfgc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=sOtUKlaQyvbKs1s5cjEHIv1HNM3TJ0wEM3C9tiz5+OSSxg053V1pf24KiMiz10wVxncMlMfw5eSPiiOCiR2xCCeUogPcOAEGE6mO6FunEBxltv01BgqjJGkkVJtW4ZJ64DtxApN7KKMAcC1AybdN9Niu7blEd6VWE5lAj+C7SiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=permerror header.from=inai.de; spf=pass smtp.mailfrom=inai.de; arc=none smtp.client-ip=144.76.212.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=inai.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inai.de
Received: by a3.inai.de (Postfix, from userid 25121)
	id DDB0E1003C5991; Wed, 08 Jul 2026 21:03:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by a3.inai.de (Postfix) with ESMTP id DD7261100AF2E4;
	Wed, 08 Jul 2026 21:03:01 +0200 (CEST)
Date: Wed, 8 Jul 2026 21:03:01 +0200 (CEST)
From: Jan Engelhardt <ej@inai.de>
To: Alejandro Colomar <alx@kernel.org>
cc: linux-man@vger.kernel.org
Subject: Re: [PATCH 3/4] console_codes.4: mention caveats for xterm's ESC ]
 50 command
In-Reply-To: <ak5sM16sSOxLmWZo@devuan>
Message-ID: <4qn8ns3s-44n1-r357-q351-r5p6pr15oq90@vanv.qr>
References: <20260708121458.46465-1-jengelh@inai.de> <20260708121458.46465-3-jengelh@inai.de> <ak5sM16sSOxLmWZo@devuan>
User-Agent: Alpine 2.26 (LSU 649 2022-06-02)
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Wednesday 2026-07-08 17:29, Alejandro Colomar wrote:
>>
>> -ESC ] 50 ; \f[I]fn\f[] ST	Set font to \f[I]fn\f[].
>> +ESC ] 50 ; \f[I]fn\f[] ST	T{
>> +Set font to \f[I]fn\f[] (normally disabled; cf. the "allowFontOps" resource)
>
>Please replace "cf." by English words.

But I was just following precedent:

man-pages$ git grep '\be\.g\.'|wc -l
481
$ git grep '\bi\.e\.'|wc -l
516
$ git grep '\bcf\.'|wc -l
10
$ git grep '\bN\.?B\.'|wc -l
0

and the Linux kernel source for completeness:

$ git grep '\be\.g\.'|wc -l
9582
$ git grep '\bi\.e\.'|wc -l
7397
$ git grep '\bN\.?B\.'|wc -l
235
$ git grep '\bcf\.'|wc -l
165


>Also, where is "allowFontOps" documented?

The console_codes.4 manpage section that is being edited talks
extensively about *xterm*, so it felt obvious that, if a term was
unclear, the reader need look no further than into the xterm manpage
to resolve his quest.

In fact, the xterm manpage even declares what constitutes "dynamic"
colors (now that I happen to look for that term which tripped me up
earlier).

Does that sound reasonable?
