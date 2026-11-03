Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.105.51.249
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793696683;
	b=ZlCblPFxRqQxEEgj58DDrn9wK6oc6sJPV1G/20ZwD4UwGda+8xSGznY8SBLhvO1VRu5e
	 PTiSX9/H7nnloit05zIx9m82ObbA2ECe3YJE+IJ6wqiEU2c2dpFpETbC/7FyBOsmwH0cd
	 iI/i4trm9HbGdlo9CYJqoKIiPxP++DDMtNXZPCuhvSezPPBl7hrMsJUq7tBUq7bPEJfdf
	 B+s8FUFRbWhifPBPdofLSk2DbhSpI4l4AtA6L5E85pG1FnIarOMt6mw7WRsuyW/cNdAnR
	 jXPYdNwx3yBgg6DObfqfkwcwGTOaU0a+P8pz6CBdM0kWJ0Lk7Bo1u5K5fzU5QW+jA1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696683;
	h=DMARC-Filter:Received:Received:Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:CC:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Originating-IP:X-ClientProxiedBy:DKIM-Signature:x-ovh-tracer-id:
	 X-VR-SPAMSTATE:X-VR-SPAMSCORE:X-VR-SPAMCAUSE;
	bh=J1neu2WIxx9Q2HzX7I5x3izcTcyQ6jCEZBiFQj8Ox2Q=;
	b=AJw9/+BcNflKMtbXqoz1w6XrC23MFRCNJ4nHrITJsvFlErWgEkqUF7mvGNoKmRnel9vp
	 6CkrW83eDMEwNVFBxzOLGxmQW3NN6Rj5w+BEMi2Jz/dbp5maxkXetScqRMCEGEPDkz64r
	 KvDx0to64FtPNx6IlydDy+jmJAWGhxVF7puW8B3MHI7CgOBYQjVeMsrqgaW2DbgjASSy8
	 cZhpxaE8icIinjUkhNOKWNUwq5ZcHHS/xUkCc85W2Tzg/5wbJ6gmcDk5bXjPZ5+R/Xjze
	 9Q/iRigBHbnjEZGVhwnWngQTqtHQdW6jlZI/pZgeqWZX045VifnZN64wS4taxtV4KVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=buffet.re;
	spf=pass smtp.mailfrom=buffet.re;
	dkim=pass header.d=buffet.re header.i=@buffet.re header.a=rsa-sha256 header.s=ovhemp1250268-selector1 header.b="vPt7S/YY";
	arc=none smtp.remote-ip=46.105.51.249
Received: from 3.mo18.mail-out.ovh.net (3.mo18.mail-out.ovh.net [46.105.51.249])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E1A606A327
	for <linux-man@vger.kernel.org>; Tue,  3 Nov 2026 09:04:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6E1A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=buffet.re
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buffet.re
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buffet.re header.i=@buffet.re header.a=rsa-sha256 header.s=ovhemp1250268-selector1 header.b=vPt7S/YY
Received: from director3.derp.mail-out.ovh.net (director3.derp.mail-out.ovh.net [79.137.60.223])
	by mo18.mail-out.ovh.net (Postfix) with ESMTPS id 4jJjLn15Smz6TVY;
	Tue,  3 Nov 2026 09:04:33 +0000 (UTC)
Received: from director3.derp.mail-out.ovh.net (director3.derp.mail-out.ovh.net. [127.0.0.1])
        by director3.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
        for <mic@digikod.net>; Tue,  3 Nov 2026 09:04:32 +0000 (UTC)
Received: from DAG5EX1.emp3.local (unknown [10.111.182.151])
	by director3.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4jJjLm5bqfz1xqV;
	Tue,  3 Nov 2026 09:04:32 +0000 (UTC)
Received: from [10.0.1.3] (88.142.38.18) by DAG5EX1.emp3.local (172.16.2.51)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 3 Nov
 2026 10:04:32 +0100
Message-ID: <93a0878e-5296-4a12-bb5e-cb508dabe66c@buffet.re>
Date: Tue, 3 Nov 2026 10:04:30 +0100
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
To: Alejandro Colomar <alx@kernel.org>
CC: =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>,
	=?UTF-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
	<linux-man@vger.kernel.org>
References: <20260917075853.10231-1-matthieu@buffet.re>
 <20260929.phoohohs5Hoo@digikod.net> <20261030.5b8905e593ff@gnoack.org>
 <e354fb0d-2173-4015-b945-c413bb1b1c44@buffet.re> <aukpsnxRzT-TPvn6@devuan>
Content-Language: en-US
From: Matthieu Buffet <matthieu@buffet.re>
In-Reply-To: <aukpsnxRzT-TPvn6@devuan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CAS8.emp3.local (172.16.1.8) To DAG5EX1.emp3.local
 (172.16.2.51)
DKIM-Signature: v=1; a=rsa-sha256; d=buffet.re; s=ovhemp1250268-selector1;
 c=relaxed/relaxed; t=1793696672; h=from:to:subject:date;
 bh=J1neu2WIxx9Q2HzX7I5x3izcTcyQ6jCEZBiFQj8Ox2Q=;
 b=vPt7S/YYCPWv++8Nkhu0ju+Y90mlgEplFqRGcxViENdWTQSGVEHeHQZcJN0q4kjAyYyi/y1XIzYreypxQnxq0rvfGCxFqpJDwA1B1jc3v7wa/G/WRDfgH6lxuEGtuG+IINqD7k+7CfvG84SufXrr/hBSkZ6M2uebCjITCvHPG4zUEFX0K/bag5S0JpDA7/BFe2fSj9jEzKksYTb+IkQq+5beB+Cfb3wlx0rgr6hH/+akOdeKDoU03DJ3nc9c/cEwSXRPWaY9ULcl3EeKSsQbkpXzNiGv5V0AD+ghP84XireBwib0B5zx7wlmAcmugxQNZdF+UVLpIfDWJfPVKe8yfg==
x-ovh-tracer-id: 11790423825132773910
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFSsIetpRZgv91P7GNGfN1plP40cNHvsl8n79eToNy0yD57YfTGXlEriI3lFqL/yeKgDI9CgAdv1n01TrQoL9SE3+i/lpTODoopvzZM9dhd7bqi4Zj0FQRzIp054HRyS+mveAj/VHjDdJwUhCShvHKLK9OH+b8blOqPNU8Z9EdyqiTxB11jUClsvr4LY57DTbU4scSl+jDIDX1xTjmvAytA7V52Tp/HL4R4yxUmxfH0ZMdxVhl7EW0r4PD6mvPqMTCDtdWMkvIxIJ45yhzHmxj8NlObrmdRqlQx5ilG2/Z263wNU0ufBnBp9Oy0PIuJxmWAg4/UqNMpWYo0Od3krjtnco3uEkN1fXC69tetp3SsN25ScgJtuBWwyFr/QxBijOC4NxrYGC0dMlQCtGxXjbG/WcXtWxk7WaXwhv9xGz/78tt+oPVlAB47cfHw3DhuWyTnLZOrAJWaKVrfSeSWupVqG6CM9TB40SFY7jxtji7YsoFyd3jkFZgVkr5/w/+16oXu/UfgT86Iysca7wOeIw5W77+E1qs5/B+62zz1P04wME29UtQFvssb5riNODzn+UzwXds8eyTU808CvLK4gDk2WluACdZQEM8sZTHHBB+oR3ftywqbZUaVpaa6/gM/rSC0AeKZXUxORGQ7gTk6zIHd3JV6JEcBCNBxJmQE8v+TUQ

Hi Alejandro,

On 11/3/26 1:24 AM, Alejandro Colomar wrote:
> I see v2 has 2 patches instead of 3.  What happened to patch 2/3?
Patch 2/3 was for AF_UNSPEC behavior, which, as Günther pointed out, did 
not need to be as precise (e.g. no need to document the bind() 
specifics, just "everything else works as-is"), so it became a silly 
one-liner and I merged it into 3/3. Sorry, I should have mentioned that 
in my reply.

-- 
Matthieu
