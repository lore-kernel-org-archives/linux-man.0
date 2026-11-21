Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=189.126.112.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795290531;
	b=F0Oekj1j9S1bimiJmT4dDWzxEuLlyBY5Po7pzbYGcsL2BLxldsoy0CdSo5zDpCWPPCuW
	 6F6KiG8AOcBQ0wiu0NUH5yGtGEAi4OHtnL3mKZ4DhD3o16ql+j/UsER1sOHj3hBmOdc/I
	 OPbNVCMlIviKpt8xU3rB0GQwFVkZSiM1wquT1ZiQabqhVFgfSvpoGHomh0e2c1mYU8Tul
	 6DRbjjy9NSbH98Bs1kng4w9GziNmss0MBdOhAoUaknXHQm9OSBOAqmBNgHy7En6LHkh5Z
	 Y3rQH/75W/9+e43wQI9rAcoqv9D3A0NGD5svmCVVXdEIgwg9/xTqu8dKuvBOUNtndHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795290531;
	h=DMARC-Filter:DKIM-Signature:Received:Received:x-locaweb-id:
	 x-locaweb-id:x-locaweb-id:X-LocaWeb-COR:X-AuthUser:Received:From:To:
	 Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=f25wi+noIPVW7l0NY/ZhYcHxohJe8d9TByk1uv45d98=;
	b=GHByLJZQcGGLwwH8G1xj3aQRC+4L+rqtTape1sA+NKL1TMIekyXhIEG6xO0Ngp+TQ7ih
	 e1+AN3G2gNI6wwaM0pgw581HzZ4Bs8phgkTNExlZ2inhx1qxCusAKgnzAgiuS5S4+7nJ8
	 PlgJV1p66vovB29EsWCTM5zkvY0GcrFGubP8WKU1PFeRTK+R/iDLAr2GE6FSRzOguBe7d
	 Q11508RgTpDpgkXlMv4ctxj2cjcYlmFBmOIBRrqHsSIyPwDhEsXzPIlo3QXKIcxPQkJyh
	 lRIWGha0N/5+k2uSzN4KNvfEh8s/+3wAhGB67XjBAFmP5UC8qd7W5RY5WiSItzcUQsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cesarb.eti.br;
	spf=pass smtp.mailfrom=cesarb.eti.br;
	dkim=pass header.d=email.locaweb.com.br header.i=@email.locaweb.com.br header.a=rsa-sha256 header.s=lw header.b=OeZS1GO2;
	arc=none smtp.remote-ip=189.126.112.3
Received: from mail1893.delibird0002.locaweb.com.br (mail1893.delibird0002.locaweb.com.br [189.126.112.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CC4606A320
	for <linux-man@vger.kernel.org>; Sat, 21 Nov 2026 19:48:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0CC4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cesarb.eti.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cesarb.eti.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=email.locaweb.com.br header.i=@email.locaweb.com.br header.a=rsa-sha256 header.s=lw header.b=OeZS1GO2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=lw; d=email.locaweb.com.br;
 h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=f25wi+noIPVW7l0NY/ZhYcHxohJe8d9TByk1uv45d98=;
 b=OeZS1GO2Wb0VplHoFrJ29DJ8D3NFdvS3oel6d3fZZnWb2/uqqKjLNY+5h0f6W4FDav2YljRRaBtB
   AtPHpmQFSI2XOKTFP9POlOEJS9BNRYHYsTuzFHV9Maavog1A/0cioK619Gdf3gNWKh+9bhbDKv96
   1J0od9xtYyqtsLJhAk04kcnpBsbBNdiokDXGLrQPded4Mjr0wPeL3fN1i9TYthnXexmDxodKDywW
   NY3+iIopVx4vusYgevajZUkDTYpQ8Gy9JvHhnwEadaK7BMDZ9rbkie0qgWA9qXNxGabuFfevIleV
   1IqEejWn7AJ4RI8I6EnT/+a5+ZPwhMKhiquIMQ==
Received: from mcbain0004.email.locaweb.com.br (189.126.112.85) by mail201123.delibird0002.locaweb.com.br id h07qpi2n8lgv for <linux-man@vger.kernel.org>; Sat, 21 Nov 2026 16:48:41 -0300 (envelope-from <cesarb@cesarb.eti.br>)
Received: from proxy.email-ssl.com.br (unknown [10.31.120.234])
	by mcbain0004.email.locaweb.com.br (Postfix) with ESMTP id B62D11808AD;
	Sat, 21 Nov 2026 16:48:41 -0300 (-03)
x-locaweb-id: 5II90qkwcFl608adNSKU11Mhs1xf0MgAzPC-CIfMoteOMOLYZkorw41aZgtgCBGiz7JOWdNt-MIUbUFIqc5n_VfP5aYHWPJEum0HS-HjJOtOgiOfMU3koHhOe3HDlCeGBJzs4Hv1ysjw4EdvZifjJyMZKp4GQa8Zbjczz0wfBf3noD4EQ-254BAD56zdX-QNQnELvBaPep8Jq7mQTuftzA== NjM2NTczNjE3MjYyNDA2MzY1NzM2MTcyNjIyZTY1NzQ2OTJlNjI3Mg==
x-locaweb-id: 5II90qkwcFl608adNSKU11Mhs1xf0MgAzPC-CIfMoteOMOLYZkorw41aZgtgCBGiz7JOWdNt-MIUbUFIqc5n_VfP5aYHWPJEum0HS-HjJOtOgiOfMU3koHhOe3HDlCeGBJzs4Hv1ysjw4EdvZifjJyMZKp4GQa8Zbjczz0wfBf3noD4EQ-254BAD56zdX-QNQnELvBaPep8Jq7mQTuftzA== NjM2NTczNjE3MjYyNDA2MzY1NzM2MTcyNjIyZTY1NzQ2OTJlNjI3Mg==
x-locaweb-id: 5II90qkwcFl608adNSKU11Mhs1xf0MgAzPC-CIfMoteOMOLYZkorw41aZgtgCBGiz7JOWdNt-MIUbUFIqc5n_VfP5aYHWPJEum0HS-HjJOtOgiOfMU3koHhOe3HDlCeGBJzs4Hv1ysjw4EdvZifjJyMZKp4GQa8Zbjczz0wfBf3noD4EQ-254BAD56zdX-QNQnELvBaPep8Jq7mQTuftzA== NjM2NTczNjE3MjYyNDA2MzY1NzM2MTcyNjIyZTY1NzQ2OTJlNjI3Mg==
X-LocaWeb-COR: locaweb_2009_x-mail
X-AuthUser: cesarb@cesarb.eti.br
Received: from desktop.home.cesarb.net (unknown [177.12.16.39])
	(Authenticated sender: cesarb@cesarb.eti.br)
	by proxy.email-ssl.com.br (Postfix) with ESMTPSA id 90CD74C07CA;
	Sat, 21 Nov 2026 16:48:37 -0300 (-03)
From: Cesar Eduardo Barros <cesarb@cesarb.eti.br>
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: Cesar Eduardo Barros <cesarb@cesarb.eti.br>,
	linux-man@vger.kernel.org
Subject: [PATCH v1 1/1] man/man2const/PR_SET_PTRACER.2const: Document EINVAL when Yama is not configured
Date: Sat, 21 Nov 2026 16:48:07 -0300
Message-ID: <cfc899195f8d66e3846133e0488d713d6eaf975c.1795289695.git.cesarb@cesarb.eti.br>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795289695.git.cesarb@cesarb.eti.br>
References: <au8GKjxzoGpp4MqU@debian> <cover.1795289695.git.cesarb@cesarb.eti.br>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The man page for PR_SET_PTRACER mentions three cases in which
prctl(PR_SET_PTRACER, ...) can fail with EINVAL, but there's a fourth
case: when CONFIG_SECURITY_YAMA=n

The code which deals with the three currently documented cases is at
security/yama/yama_lsm.c which is only compiled when "Yama support" is
configured.  When it isn't, it falls through to the default case at
kernel/sys.c which returns EINVAL.

Fixes: 6f86bef66936 (2013-01-11; "prctl.2: Document EINVAL error for PR_SET_PTRACER")
Signed-off-by: Cesar Eduardo Barros <cesarb@cesarb.eti.br>
---
 man/man2const/PR_SET_PTRACER.2const | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/man/man2const/PR_SET_PTRACER.2const b/man/man2const/PR_SET_PTRACER.2const
index 48bd8f04e104..b07ee5ae4d2d 100644
--- a/man/man2const/PR_SET_PTRACER.2const
+++ b/man/man2const/PR_SET_PTRACER.2const
@@ -57,6 +57,9 @@ .SH ERRORS
 is not 0,
 .BR PR_SET_PTRACER_ANY ,
 nor the PID of an existing process.
+.TP
+.B EINVAL
+Yama support is not built into the running kernel.
 .SH STANDARDS
 Linux.
 .SH HISTORY
-- 
2.56.1

