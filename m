Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.105.60.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793662665;
	b=f8m7kuXhwUdsYc9sMLU1IJQk46CjWNVaA6eu2CWOuv02t1dChAzcJqiCFhdU3UENBHBR
	 FDRxNZsd3FZiLYyJXs/t3/9Bqsh4zIveDrKceAOmmjmf8ADsNDgWmYW8AnKHfjfbkKtKk
	 9upB9V2oa4pxN01T5H/BmZPiDReAZV8W1/K4Ld06HmeRgTAXgWlaGhFI1cHtET9zbV1Q4
	 COLCcpTYZwX+H5c3nIXxX72WAO0ZbrwEB9OT82e/sIpx3OUHuGAINOUCm1+vzqbpeSelw
	 xtK2O/ee9u0XeiafNTwAqEcjH/V7RwcLl4w8J5drjhig4UIRSuA0+bfE08yzwstEHUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793662665;
	h=DMARC-Filter:Received:Received:Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:CC:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Originating-IP:X-ClientProxiedBy:DKIM-Signature:x-ovh-tracer-id:
	 X-VR-SPAMSTATE:X-VR-SPAMSCORE:X-VR-SPAMCAUSE;
	bh=D/uaX7D1dL6gi5vTE8/nEaHQw4ZyRlYX/Ccs/Z7QNyE=;
	b=XUhuGNKt9zhG6JKYeFaY9bSIWZvSHdOiB/qCxrVmfTEwE8YgcLSQRvtEQVd7mXi0NqOP
	 cazL/LhuFbCtlBbaCrJnCdhu/Z++AbjrgXemZqJJY2UV6D8ChLeuzokHik2MxAsfQ6dC2
	 99TWhjCokVTE/ND9zQDWHjyRiLBv+v4+Nw0KSq/z40HihtgN4O1nHB87sZPWnRPolcUhI
	 NaUCisAUymro0LkqeIz/6rEnW/Tm5c/9m1h0lp/l1T82F+9+mwQ1ELZQRldenK+3jBTyY
	 eJQ5bhzn5UzTTC22nKSlkNdlzF5ZVptFa5Ss5NpTSp+s3LmKzY1n/eCI6Wv/lGL8EHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=buffet.re;
	spf=pass smtp.mailfrom=buffet.re;
	dkim=pass header.d=buffet.re header.i=@buffet.re header.a=rsa-sha256 header.s=ovhemp1250268-selector1 header.b=VVSEVNU0;
	arc=none smtp.remote-ip=46.105.60.197
Received: from 8.mo563.mail-out.ovh.net (8.mo563.mail-out.ovh.net [46.105.60.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5068606A32C
	for <linux-man@vger.kernel.org>; Mon,  2 Nov 2026 23:37:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5068606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=buffet.re
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buffet.re
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buffet.re header.i=@buffet.re header.a=rsa-sha256 header.s=ovhemp1250268-selector1 header.b=VVSEVNU0
Received: from director2.derp.mail-out.ovh.net (director2.derp.mail-out.ovh.net [79.137.60.36])
	by mo563.mail-out.ovh.net (Postfix) with ESMTPS id 4jJSmb4QB7z5xSk;
	Mon,  2 Nov 2026 23:37:35 +0000 (UTC)
Received: from director2.derp.mail-out.ovh.net (director2.derp.mail-out.ovh.net. [127.0.0.1])
        by director2.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
        for <mic@digikod.net>; Mon,  2 Nov 2026 23:37:35 +0000 (UTC)
Received: from DAG5EX1.emp3.local (unknown [10.111.174.171])
	by director2.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4jJSmb2xtsz1xqd;
	Mon,  2 Nov 2026 23:37:35 +0000 (UTC)
Received: from [10.0.1.3] (88.142.38.18) by DAG5EX1.emp3.local (172.16.2.51)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 3 Nov
 2026 00:37:34 +0100
Message-ID: <e354fb0d-2173-4015-b945-c413bb1b1c44@buffet.re>
Date: Tue, 3 Nov 2026 00:37:34 +0100
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
Subject: Re: [PATCH 0/3] Add Landlock UDP support documentation
To: =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
CC: =?UTF-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, Alejandro Colomar
	<alx@kernel.org>, <linux-man@vger.kernel.org>
References: <20260917075853.10231-1-matthieu@buffet.re>
 <20260929.phoohohs5Hoo@digikod.net> <20261030.5b8905e593ff@gnoack.org>
Content-Language: en-US
From: Matthieu Buffet <matthieu@buffet.re>
In-Reply-To: <20261030.5b8905e593ff@gnoack.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CAS4.emp3.local (172.16.1.4) To DAG5EX1.emp3.local
 (172.16.2.51)
DKIM-Signature: v=1; a=rsa-sha256; d=buffet.re; s=ovhemp1250268-selector1;
 c=relaxed/relaxed; t=1793662655; h=from:to:subject:date;
 bh=D/uaX7D1dL6gi5vTE8/nEaHQw4ZyRlYX/Ccs/Z7QNyE=;
 b=VVSEVNU0no77wRLEIwNrHBUQ6Tscn/iX2eNKzngUMkvcsYvZROarFiBWFpFEXspeMvmko1ukNO1Hy1qVfhFsmaR5iT7YKyQZQXpkP11M0Tuw7qLyV3wJLQMH8ClehLITNEwt1NVpqidRoI/682fc66NWkiJj7K4Os5pBcH7UoOBqtLsR2zqb2oBygpcOExVuI9yJpBzzdxHA6b0g3QbjcjIrnzEizyMapux8JEoWa5mXOgeN9xdEJQCMNmIzB7ghYiPZUSipWpi3qAtW1rtQs63tBTaYeLKn5jm4Lw1uCIfIOsTwkKVrZXIsdMxtsX4iS4+fUv1M6vCEZ51mc4rTJw==
x-ovh-tracer-id: 2215489542040805910
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTEaanI9lXT4xAoL57rdrZDJ81aLVxI6gCEMX1AJlVUgZYuHxpe42JHXEWXQdEoW+sqHIcqwypxRn2ntJk9C1m/XLQxGblzlTfR6lKRsumTU9WEkHAtZ1r6T+3MCEzpW0kFTBNRWC7FQtt86edv5U5jUN+pyUXb9/AukW4546CKGLwgZUYcKoJx+Orh2Hsr5GGIgC7Eg96QfDMQp5EUYC+0s4Igg/gAgm/vzPZvc5Uo/vbnPv5zEeBduj7yhAUbV2AprXhVJr2cUSUrKpsKR78uFcKF+FTkls+0tXdlCBYlDz+wOfClv1IhVDP2njYn8BlHdhH5+vRdpuZrOOGc7RIn+PDbIbNJshb7N4UYFnVAhUZjQ4K96+jiz10pFnfM9wLuy5f2jxuTCDeMRCmAIzHNV6SPGVATzxDUUfDBXOxuKAkNIyUTPGnA2H8px6O+2Umgsz6DHATUKP6b7h+KMJ/5xQAcdPvrfjfwbu/jcJPZGB8D66dEjI8riguf4n0TGbnkQwnISI94vWZPUnM8KuQ8Cc8JeNnPeaPXSTZtwZeV5BY5oxNr55xPtNs4MCL6JwoPAK8aeiSfadFBhToqupkecexRRtb0wkMbTAhjaLQ5y//f3tHGX/zi9lEx5+KHoKZ2rg4o/9n+UalcpN4+NPwph2pv5PQ6LgnSrwFZkZI1clw

Hi Günther,

On 10/30/26 8:24 PM, Günther Noack wrote:
> Friendly ping on this, to make sure we don't forget it -- do you think
> you could find the time to send a small follow-up to this?
Sorry, busy days. Here are the patches with your comments taken into 
account and fixed, and I have a patch ready to sync the UAPI header if 
these look ok.

Have a nice day,

Matthieu
