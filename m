Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=201.76.49.247
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794047208;
	b=o1QnUQE0VsnszmcspVh/3QWi7Qc737jA3znkY96te4NhO9YTa/LOKNgl8sIDtnuaBVg3
	 qulLB0fkrb0awoHB59WpbQI0uGFINtGbTvtx6VwvkFjJkq2uFBH+mbx8Z5EehHRunDlli
	 uk7mvPQMHnD3RoyzQhNxrCZgDBlCLeFtbYgwW5/KYYHpvMu2bcSaQbJqUr+3vtf6e437D
	 4oZjkET6uWqwlRjxw5lK0P2iUqoA3jR7jau10tOCKBsgDrONl7ayKT6Rj2r/SPIr0Jr0Y
	 rsz2pXmwfYCwtlliF285kIzGoWBqLvK6wlHkQEZnwrGUYiPHbVQP2tOj3j6IWfUbqpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794047208;
	h=DMARC-Filter:DKIM-Signature:Received:Received:x-locaweb-id:
	 x-locaweb-id:X-LocaWeb-COR:X-AuthUser:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Content-Language:To:Cc:From:Subject:
	 Content-Type:Content-Transfer-Encoding;
	bh=c0kqi7qjyTwOtmdP22q8UGSSPQSEUNSMMLy5FBaRRJU=;
	b=expZrloPeldGUvXebpTepLx4WdLf4hkH6H4W6LgivOeguZQSvWHpGdlvscXZHwYkKKiD
	 tfpl8dYBXD8OnfXWsvKQW8DDm0Qu1Eijb0m5pC1+pnfFKXFjr06wJzf6eIZQMksuviaEY
	 Y6pbJsy98elqqbEVUdgiXGPes0mwz1o7kOn92NuLYz3Em9HKYwP6iKowLT9XY/HtWnRM3
	 yiZ48Trh0Y/xpmXhxx5Xll+HnCzgtmHje9XEb+mtB0IwM6iMYYUi4YuL/dCdDoL8E9Aiu
	 ss7QZBmU9a2ByLDJZ11X877kKvE9urK8aaoiGyupQb4VhSUVOgnLyNFICv2JELDFKzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cesarb.eti.br;
	spf=pass smtp.mailfrom=cesarb.eti.br;
	dkim=pass header.d=email.locaweb.com.br header.i=@email.locaweb.com.br header.a=rsa-sha256 header.s=lw header.b=M6lnEVCL;
	arc=none smtp.remote-ip=201.76.49.247
Received: from mail201247.delibird0002.locaweb.com.br (mail201247.delibird0002.locaweb.com.br [201.76.49.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF52606A326
	for <linux-man@vger.kernel.org>; Sat,  7 Nov 2026 10:26:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEF52606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cesarb.eti.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cesarb.eti.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=email.locaweb.com.br header.i=@email.locaweb.com.br header.a=rsa-sha256 header.s=lw header.b=M6lnEVCL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=lw; d=email.locaweb.com.br;
 h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type:
 Content-Transfer-Encoding;
 bh=c0kqi7qjyTwOtmdP22q8UGSSPQSEUNSMMLy5FBaRRJU=;
 b=M6lnEVCLZ6elRLtZFuuArl+8zesX68hl3V1CZo1HHceDcWrm5UVcqxVvXQWMiirVDWtfNWFiqI8p
   jeNYnM+SwG9P6uvlx/LLs2+kMv8/Av/+WEsbJQb3srafH/30aTO9IcITmO5amUZwGrYt6LXpqIdO
   i/WlYAWvgi648Dar426Kv/X5EO2QsQD2Xm/PiA6Je5crzaM36GbXvQ6ClPym9hJSJIFtPxpRxo9n
   y6weltWiHOuOrgeyFto4D0H2lXcbSxJQkQzlPM8iTXWckGDQk3jDF609siFr8o3TlmsDr956p3dC
   bgaDvygK2bdKlJNCOelLy9cCumbjXhhszeHihw==
Received: from mcbain0020.email.locaweb.com.br (189.126.112.15) by mail201123.delibird0002.locaweb.com.br id htrudo2n8lg4 for <linux-man@vger.kernel.org>; Sat, 7 Nov 2026 07:26:35 -0300 (envelope-from <cesarb@cesarb.eti.br>)
Received: from proxy.email-ssl.com.br (zubat0003.email.locaweb.com.br [10.31.120.55])
	by mcbain0020.email.locaweb.com.br (Postfix) with ESMTP id 9E78014801CF;
	Sat,  7 Nov 2026 07:26:35 -0300 (-03)
x-locaweb-id: 5II90qkwcFl608adNSKU11Mhs1xf0MgAzPC-CIfMoteOMOLYZkorw41aZgtgCBGiz7JOWdNt-MIUbUFIqc5n_VfP5aYHWPJEum0HS-HjJOsB0o1gQgJTRa0pQHPNXeDC4i8ronLEaSHq0pU2crAX5BzFtMGCOZ65ay_ZKTJXCsgGZsCM25liJqVxEymPAKI4bmltfP8EqSLEJQNahzLsPw== NjM2NTczNjE3MjYyNDA2MzY1NzM2MTcyNjIyZTY1NzQ2OTJlNjI3Mg==
x-locaweb-id: 5II90qkwcFl608adNSKU11Mhs1xf0MgAzPC-CIfMoteOMOLYZkorw41aZgtgCBGiz7JOWdNt-MIUbUFIqc5n_VfP5aYHWPJEum0HS-HjJOsB0o1gQgJTRa0pQHPNXeDC4i8ronLEaSHq0pU2crAX5BzFtMGCOZ65ay_ZKTJXCsgGZsCM25liJqVxEymPAKI4bmltfP8EqSLEJQNahzLsPw== NjM2NTczNjE3MjYyNDA2MzY1NzM2MTcyNjIyZTY1NzQ2OTJlNjI3Mg==
X-LocaWeb-COR: locaweb_2009_x-mail
X-AuthUser: cesarb@cesarb.eti.br
Received: from [192.168.96.194] (unknown [177.12.17.240])
	(Authenticated sender: cesarb@cesarb.eti.br)
	by proxy.email-ssl.com.br (Postfix) with ESMTPSA id 4EC6D4C09F8;
	Sat,  7 Nov 2026 07:26:33 -0300 (-03)
Message-ID: <d18b61d8-640e-4474-9a61-9cc5aac1c7d9@cesarb.eti.br>
Date: Sat, 7 Nov 2026 07:26:32 -0300
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
Content-Language: en-US, pt-BR
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: linux-man@vger.kernel.org
From: Cesar Eduardo Barros <cesarb@cesarb.eti.br>
Subject: PR_SET_PTRACER can also EINVAL when Yama is not configured
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

The man page for PR_SET_PTRACER mentions three cases in which 
prctl(PR_SET_PTRACER, ...) can fail with EINVAL, but there's a fourth 
case: when CONFIG_SECURITY_YAMA=n

The code which deals with the three currently documented cases is at 
security/yama/yama_lsm.c which is only compiled when "Yama support" is 
configured. When it isn't, it falls through to the default case at 
kernel/sys.c which returns EINVAL.

(I was alerted to this at 
https://github.com/cesarb/count_instructions/pull/1 where I was told 
that it fails with EINVAL when the Yama LSM is not installed. I had 
written the code based on the man page, so I hadn't considered this 
fourth case.)

-- 
Cesar Eduardo Barros
cesarb@cesarb.eti.br

