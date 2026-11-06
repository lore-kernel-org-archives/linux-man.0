Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=37.205.11.127
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793932471;
	b=wzzAkoGohNHIvTIR+4ZLmKWkul4oFkOceQSiDsT42WvC/ICjhAj3rQDvTkQNieVU6zf/
	 56Q2+jrSipdWMHoBzThFQfPe3ZUef8erkhl0Io5VGlAyeOcx1j5hRJVxucM/FcXuhicid
	 39/HD6/jmspDvJTfhlhxPmtZyBiIxoVPLVcbF4h8iCCBiA/Ee3OxDH5cyw0ObBNlB9FxV
	 tYuBjC1X6DeBWEa8i40GemVA/ggzS6HJm315a5Rg7iQLpcyoKs0gXmY4IPVpl6kUTAZyq
	 k72v3oWNtLQYD6cv5GwsL4CZBH7aE6p2dZUEk4tkc7Xe9g+dA+wMmDwdlUi+gIKwd1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793932471;
	h=DMARC-Filter:DKIM-Signature:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:To:
	 From:References:In-Reply-To;
	bh=ZbJU2qKs4J5J2HbzsazT6o5k90pfmcg1xQSZLZYZQxs=;
	b=BeJUvdSF9RvWnCMdcnv7bttQXogRbupJl5qHbZGUNmrKID52mrScH72DPjEMM7CIyXPz
	 jGFvf3/BkyV0RZrU6qQXUzv3H8X26UdxwSY/SHQ3a9i4WA2koEcADuRBPtIStdAwCEJdw
	 a0xX28TDCJ2UGl3OZuxkJmPvGO2H+VTObXQIMCsS0SqZFVPRWrYyID12K4RgEFQnB78wk
	 s5kXS4lcS9edDyIZVdpZXinz1UDVASWQHSBJyBfP6wBaKY8a1u3T2vt/uy4IF+4qAPBBc
	 eV13vlHO795CgOC/fOE8vKqYOZUjLpsLknBt5Cvru5jkrIXgbS1pOACNrGZDeF9gP7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=loang.net;
	spf=pass smtp.mailfrom=loang.net;
	dkim=pass header.d=loang.net header.i=@loang.net header.a=rsa-sha256 header.s=default header.b=NRF51Jwi;
	arc=none smtp.remote-ip=37.205.11.127
Received: from tem.loang.net (tem.loang.net [37.205.11.127])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F75B606A328
	for <linux-man@vger.kernel.org>; Fri,  6 Nov 2026 02:34:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F75B606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=loang.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loang.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=loang.net header.i=@loang.net header.a=rsa-sha256 header.s=default header.b=NRF51Jwi
DKIM-Signature: a=rsa-sha256; bh=ZbJU2qKs4J5J2HbzsazT6o5k90pfmcg1xQSZLZYZQxs=;
 c=relaxed/relaxed; d=loang.net;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@loang.net; s=default; t=1793932454; v=1; x=1794364454;
 b=NRF51Jwi9DBvMg2QY5YHrh4znuHtMySsgP/EH4fGMBO5hw9rhkeYaLfCgLVzKptIpHgr+6sB
 1JQEK99YgflJjmUp4hXpspTJHsWu+EHSUznhd6yrKIL9oVHFsTaEP92r9ojEc1tmnMNC7F7zBmg
 tpIWoDlAtdsk/BI/yRun6tcw17oXLfBIf4qx06sGjIN6PUnzG4e1WeMUhFkg7GV7nBXKyaK+x18
 NOTVLdX9vornV5vqlhoSIf05oV2KeY0EvQF9qR046+DZazppTm0ZCSNOj8S1NC+qUVaUjB4GYKN
 Zoyy3HIO7YNPX3pSlA2Weq+Y6jzJtD/TJaST/pEB4bJlA==
Received: by tem.loang.net (envelope-sender <cnx@loang.net>) with ESMTPS id
 b17e9d36; Fri, 06 Nov 2026 02:34:14 +0000
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Nov 2026 11:34:12 +0900
Message-Id: <DMNRZBG2DIZW.3EFUTZS9WX48K@loang.net>
Cc: <groff@gnu.org>, <linux-man@vger.kernel.org>
Subject: Re: groff 1.25.0.rc4 available for evaluation
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>,
 <platform-testers@gnu.org>
From: =?utf-8?q?Nguy=E1=BB=85n_Gia_Phong?= <cnx@loang.net>
References: <20261029232813.aqji7n3bznufkpua@illithid>
In-Reply-To: <20261029232813.aqji7n3bznufkpua@illithid>

Hi,

On 2026-10-29 at 18:28-05:00, G. Branden Robinson wrote:
> groff 1.25.0 release candidate 4, 1.25.0.rc4, is now available from
> GNU's alpha site.  You may download the distribution archive from there.

Hi, there's a typo in src/roff/groff/tests/soquiet-request-works.sh
that caused the test to fail since its refactoring in 111c42a69abc;
s/doc/input/ should fix it.

Otherwise, I'm happy to report that this RC builds fine on Guix.

Best wishes,
Phong
