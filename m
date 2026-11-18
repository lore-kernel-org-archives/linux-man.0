Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=87.98.174.88
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795034796;
	b=V1R0ydFQWL4Pp4PxREdLaMuZlLR3to9v+g374kRQnAs2hSaVrOrdDILr7IDHoD8tvEjc
	 gUCalP4jNbNz4Tx72xF/sL8anLWyTJVBM+AN2JLpEhuFyAlHkIlfyjaerk5UkVo94W8YL
	 FMuNIF93cS+oPp9v2yiJoQbo00KTOzMIMxukTSkpHJ1spWDzTFbkgk61cfAK2V2WpirgN
	 q/E85OVeqlQ4CdCrDx2Syix5/MYxf+saQvBJWI0eQ/YvFNmlOtNzHlKqmPlE+92Aj/fdC
	 J+SxVXwtWGvrdNGIXctTBHibEVSn/NdsWjwexmU6WiJTTwz55NAelrPu/hDo6l7u/2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034796;
	h=DMARC-Filter:Received:Received:Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Subject:To:CC:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Originating-IP:X-ClientProxiedBy:DKIM-Signature:x-ovh-tracer-id:
	 X-VR-SPAMSTATE:X-VR-SPAMSCORE:X-VR-SPAMCAUSE;
	bh=cPX9tfJ+lO74Wk+102MR3+GlANtISt7I1lKGZmMQRpE=;
	b=CumnceU5OyDcHwaErwp6WOO2x8XDsQYVMAHNlLU7YrPgkAbp8l8Qd8vvm47rpi3c3sP8
	 oTZ/Z1zT7LdhHqWggfbfpsOGpLoe35M9fVQDJIMzl0EkSHoBzCoAsghC2AttMVd+9K38o
	 Xlk+gvzHWsCfyUSlev7OkXUpBL9REIEGcHfUSIPMuVN7hkzfSrb7uT3EX0pdfEePldZ0f
	 DMXeVPul1LTYXMFVgl9/aWKEWuVB5KgV1ffwR44j1o176onvab9hOgJfN12nw1SsqKq0b
	 /hlnUro+5G7RV/D9v5Yl64kc5HNkVjLSLLqw0sB/hx3iUwht/vCOM7ksq2HO34ALUhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=buffet.re;
	spf=pass smtp.mailfrom=buffet.re;
	dkim=pass header.d=buffet.re header.i=@buffet.re header.a=rsa-sha256 header.s=ovhemp1250268-selector1 header.b=T8GuEA1z;
	arc=none smtp.remote-ip=87.98.174.88
Received: from 3.mo17.mail-out.ovh.net (3.mo17.mail-out.ovh.net [87.98.174.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F09606A32A
	for <linux-man@vger.kernel.org>; Wed, 18 Nov 2026 20:46:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4F09606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=buffet.re
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buffet.re
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buffet.re header.i=@buffet.re header.a=rsa-sha256 header.s=ovhemp1250268-selector1 header.b=T8GuEA1z
Received: from director4.derp.mail-out.ovh.net (director4.derp.mail-out.ovh.net [79.137.60.37])
	by mo17.mail-out.ovh.net (Postfix) with ESMTPS id 4jVDCk4zTNz81Xw;
	Wed, 18 Nov 2026 20:46:26 +0000 (UTC)
Received: from director4.derp.mail-out.ovh.net (director4.derp.mail-out.ovh.net. [127.0.0.1])
        by director4.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
        for <mic@digikod.net>; Wed, 18 Nov 2026 20:46:26 +0000 (UTC)
Received: from DAG5EX1.emp3.local (unknown [10.108.54.38])
	by director4.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4jVDCk2RBrz1y3H;
	Wed, 18 Nov 2026 20:46:26 +0000 (UTC)
Received: from [10.0.1.3] (88.142.38.18) by DAG5EX1.emp3.local (172.16.2.51)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 21:46:25 +0100
Message-ID: <77089dd4-e776-4f56-8aad-508dcba53955@buffet.re>
Date: Wed, 18 Nov 2026 21:46:25 +0100
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Matthieu Buffet <matthieu@buffet.re>
Subject: Re: [PATCH v2 2/2] man/man?/landlock*.?: Document UDP support
To: Alejandro Colomar <alx@kernel.org>, "G. Branden Robinson"
	<g.branden.robinson@gmail.com>
CC: =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>,
	=?UTF-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
	<linux-man@vger.kernel.org>
References: <e354fb0d-2173-4015-b945-c413bb1b1c44@buffet.re>
 <20261102233932.29912-1-matthieu@buffet.re>
 <20261102233932.29912-2-matthieu@buffet.re>
 <20261106.73089117d0af@gnoack.org> <au8HcBs37d1yUkZ0@debian>
 <bc495b26-2e26-4fc0-934b-37d55cb423a8@buffet.re> <avogyPekOEm-xBPV@devuan>
 <20261115215359.tcfw7u3apvbqxde5@illithid> <avwiSt7sMInH0_d-@devuan>
Content-Language: en-US
In-Reply-To: <avwiSt7sMInH0_d-@devuan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CAS7.emp3.local (172.16.1.7) To DAG5EX1.emp3.local
 (172.16.2.51)
DKIM-Signature: v=1; a=rsa-sha256; d=buffet.re; s=ovhemp1250268-selector1;
 c=relaxed/relaxed; t=1795034786; h=from:to:subject:date;
 bh=cPX9tfJ+lO74Wk+102MR3+GlANtISt7I1lKGZmMQRpE=;
 b=T8GuEA1zuNVols9AQGSuNeTCG9+HTMBT85TXTTfSeO6hLslSAXLhuSh/Xr33eGXNRFt4KgYVjWsOapAwJa8MK6Xl0hnTQPz93xsd015dFeydd7Y0Pk4WILz4KBp/1q0NqiKWUgiTR+8R6hl2F71T/8c8C6j68tx6OAanJnrsMlKSqlcp14H/JqFpkWlFHuXlHubrxSyu0w1iDKKA8dVGQc9StaGsuGn0HRNBoB9hS+CKTewNr4D42KqFXHl0iI52Iry8FtKyAoLUdl7jtnxOl760p4v5WcLgkBnM0fw6Woj3KNP4MQbdekifzD+DFA2DGbTxiB+GlGtx673jMS9n/g==
x-ovh-tracer-id: 1054405265027457558
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFyJBFXvtGu0xiBWUplePCUnMP80SF1XJe8GGROODbOYwWGPyOSagOcnbOoBT9hsEnTu4jqBduh9hYxWKkjFtP+Vo//fdLhozMMnhjx+UkywHb2a9dG+CGbSUOkmkRXTmF/2IEp9fxwPEV9I/YmybEtRYBndGJDbDsLXopEPG24fIWI7H7FTdDCC1w6iS//anqd4DtVJsPoPj9ehGrQ33ymcVorTs76xCFtIy7fN8hnrcVSPqFZAWFchUuVwKzoZI45Y47AqC2hTmFViQCTwJ+WNLOhe0cyumBK1mq7PCc3LJ+kVz9LKoAsfBZqT9+r6qpqGeOtsb5b2pQ04zpLCgI2jdpQBJAgDIlb/wXLI6zOjB5U0KgalZ+Wuakz5Fn51+cRssop3Ezy7qhTNFjVIehriHsIs+/prT0LFlUa+ladH8H7JluDyzbjFYAF6rduVqqfeK20qC7oD2djkvdAEulkQSvChDIs8ZqyZjLpEhqmA4jA0IedQSZK6StLqkrFRW02/ZVP4CG+UsNrxrSgG+dZDZE2fM9ZUOkctjZ9ioKFYbkyNfzpvs1mL5ALLAEuRta7M5WUBPk9GHgClFxLYl/zXAKQcICP1PmdHRdSZCeif5p+Q48JX8SGmM2TmXALxf6tcj3ZqH5OwEL+MfdCV1nOiVif93SC/KLK/E4UoIvswQ

Hi Alejandro, Branden,

On 11/17/26 10:47 AM, Alejandro Colomar wrote:
 > Thanks!  That sounds good.  Perhaps we could put the last sentence in
 > parentheses, as it's not part of the specification.

Here is a version with the fix. I also fixed a bad copy-paste of bullet 
points in the AF_UNSPEC note (unordered list of alternatives).

On 11/15/26 10:53 PM, G. Branden Robinson wrote:
> I also recast the text to tighten wording, to reduce use of passive
> voice, and to favor present tense over future.

A way into my prose is always found by passive voice. That is much 
better, thank you both!
Matthieu
