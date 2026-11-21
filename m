Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=189.126.112.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795290529;
	b=JZ2BZj2PLWyO5Nw1e6nY/2+2uCOXFvHTXJKNej+Y5BVgKfyyBcgrjdT8pQdXR52t4ZUh
	 o/wWy+m2wb4vi1cuHLhtfHKIzPu744y5hS814TYRmQUxkl5ie+hMFxugiCdrZgGTQXAGw
	 887V0tmuCtwshlYjYmak4dz6cZtxXyUZZUKXrcilk3HDN1hiT/21g9wGKGyggdiMer10P
	 nIjnfpcoZ+mYXLeiJN8JViE8ZNdiuY95lKDOyNke2S677CLEUzm9NX9uyHqrSEEKm6Iev
	 F2NDmwrlfgDm9QVhT7ctjztY/Wjla4HLm+ncgkUOSw1QBJU0o+h/KNNBPEYafNm2vwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795290529;
	h=DMARC-Filter:DKIM-Signature:Received:Received:x-locaweb-id:
	 x-locaweb-id:x-locaweb-id:X-LocaWeb-COR:X-AuthUser:Received:From:To:
	 Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=58GOLYS3GahA/nI2fUC2UQJljlHj7MUcL3zf3o5toHw=;
	b=RPITwxQLPCkdHW4258kgFiQ8URWwjtucFCRg+kRITgHNLfKhQXemhiJe18KAJxtj/PvG
	 cpaZtDsVysW7bDCEfZDI5Xw+hpVW1PGeZQDC3LBcsMqRcnuZsnrKXUWXorPv+hwVqzgkx
	 3xdGcTYrvfssH3K/jVwwFW8sm/vGumdO6Iknqty1dsD/fo6QNLpdaqez3hTNzzfEFwnp9
	 gOO7fbsbb6AFxafzsJJEWFneHL/dPd/vQi8NFm/YI+/zWqlaHuge1OpDGNvmnZVxCdgPE
	 GSZBiIvrvjX1M+cQQTKmMpVugokQ35xKlpxovUCdjasfOHIn4x9Gf9sKKDOcJ+pRiCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cesarb.eti.br;
	spf=pass smtp.mailfrom=cesarb.eti.br;
	dkim=pass header.d=email.locaweb.com.br header.i=@email.locaweb.com.br header.a=rsa-sha256 header.s=lw header.b=XT8AGGcs;
	arc=none smtp.remote-ip=189.126.112.2
Received: from mail1892.delibird0002.locaweb.com.br (mail1892.delibird0002.locaweb.com.br [189.126.112.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A96D606A320
	for <linux-man@vger.kernel.org>; Sat, 21 Nov 2026 19:48:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A96D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cesarb.eti.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cesarb.eti.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=email.locaweb.com.br header.i=@email.locaweb.com.br header.a=rsa-sha256 header.s=lw header.b=XT8AGGcs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=lw; d=email.locaweb.com.br;
 h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding;
 bh=58GOLYS3GahA/nI2fUC2UQJljlHj7MUcL3zf3o5toHw=;
 b=XT8AGGcsfHuc67e6niRo5gGaPLxYFKLok1QP5Da+Z4ymBOpWd2hte+cPDpahf14VHtTR5gG4GZU6
   b0uUMNe2zcst/HRQNfguBDLvryF9NO5C5eqppYQ2WqmrKM9nJ1DAtCTI3F7pcGLMG0lgzm/alX1J
   xhJyrmFSIPFLXwxgCmGQ/hnGXzOOo7ylJtKLmftgo24XFebRBhIgE33p3fKz2dlKrUsH4V8aBAZc
   iwJOp2tIFrPJ0pU90EZ6fCjf820IFtdqyNR36RAsEg1vVCjPUxc9FhCl09yGLhGlgsw+cqC4rQsG
   CHCCXvTHLewk7a6bWNjWb1am9MDEQ3HRLt3lsg==
Received: from mcbain0015.email.locaweb.com.br (201.76.49.38) by mail201123.delibird0002.locaweb.com.br id h07qpa2n8lg7 for <linux-man@vger.kernel.org>; Sat, 21 Nov 2026 16:48:37 -0300 (envelope-from <cesarb@cesarb.eti.br>)
Received: from proxy.email-ssl.com.br (unknown [10.31.120.234])
	by mcbain0015.email.locaweb.com.br (Postfix) with ESMTP id 8EDA940033C;
	Sat, 21 Nov 2026 16:48:37 -0300 (-03)
x-locaweb-id: 5II90qkwcFl608adNSKU11Mhs1xf0MgAzPC-CIfMoteOMOLYZkorw41aZgtgCBGiz7JOWdNt-MIUbUFIqc5n_VfP5aYHWPJEum0HS-HjJOtOgiOfMU3koHhOe3HDlCeGBJzs4Hv1ysjw4EdvZifjJyMZKp4GQa8Zbjczz0wfBf3noD4EQ-254BAD56zdX-QNQnELvBaPep8Jq7mQTuftzA== NjM2NTczNjE3MjYyNDA2MzY1NzM2MTcyNjIyZTY1NzQ2OTJlNjI3Mg==
x-locaweb-id: 5II90qkwcFl608adNSKU11Mhs1xf0MgAzPC-CIfMoteOMOLYZkorw41aZgtgCBGiz7JOWdNt-MIUbUFIqc5n_VfP5aYHWPJEum0HS-HjJOtOgiOfMU3koHhOe3HDlCeGBJzs4Hv1ysjw4EdvZifjJyMZKp4GQa8Zbjczz0wfBf3noD4EQ-254BAD56zdX-QNQnELvBaPep8Jq7mQTuftzA== NjM2NTczNjE3MjYyNDA2MzY1NzM2MTcyNjIyZTY1NzQ2OTJlNjI3Mg==
x-locaweb-id: 5II90qkwcFl608adNSKU11Mhs1xf0MgAzPC-CIfMoteOMOLYZkorw41aZgtgCBGiz7JOWdNt-MIUbUFIqc5n_VfP5aYHWPJEum0HS-HjJOtOgiOfMU3koHhOe3HDlCeGBJzs4Hv1ysjw4EdvZifjJyMZKp4GQa8Zbjczz0wfBf3noD4EQ-254BAD56zdX-QNQnELvBaPep8Jq7mQTuftzA== NjM2NTczNjE3MjYyNDA2MzY1NzM2MTcyNjIyZTY1NzQ2OTJlNjI3Mg==
X-LocaWeb-COR: locaweb_2009_x-mail
X-AuthUser: cesarb@cesarb.eti.br
Received: from desktop.home.cesarb.net (unknown [177.12.16.39])
	(Authenticated sender: cesarb@cesarb.eti.br)
	by proxy.email-ssl.com.br (Postfix) with ESMTPSA id 664944C07CA;
	Sat, 21 Nov 2026 16:48:34 -0300 (-03)
From: Cesar Eduardo Barros <cesarb@cesarb.eti.br>
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: Cesar Eduardo Barros <cesarb@cesarb.eti.br>,
	linux-man@vger.kernel.org
Subject: [PATCH v1 0/1] man/man2const/PR_SET_PTRACER.2const: Document EINVAL
Date: Sat, 21 Nov 2026 16:48:06 -0300
Message-ID: <cover.1795289695.git.cesarb@cesarb.eti.br>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <au8GKjxzoGpp4MqU@debian>
References: <au8GKjxzoGpp4MqU@debian>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The man page for PR_SET_PTRACER mentions three cases in which
prctl(PR_SET_PTRACER, ...) can fail with EINVAL, but there's a fourth
case: when CONFIG_SECURITY_YAMA=n

The code which deals with the three currently documented cases is at
security/yama/yama_lsm.c which is only compiled when "Yama support" is
configured.  When it isn't, it falls through to the default case at
kernel/sys.c which returns EINVAL.

Cesar Eduardo Barros (1):
  man/man2const/PR_SET_PTRACER.2const: Document EINVAL when Yama is not
    configured

 man/man2const/PR_SET_PTRACER.2const | 3 +++
 1 file changed, 3 insertions(+)

Range-diff em relação a v0:
-:  ------------ > 1:  cfc899195f8d man/man2const/PR_SET_PTRACER.2const: Document EINVAL when Yama is not configured
-- 
2.56.1

