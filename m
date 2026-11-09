Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.87.224.107
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794214771;
	b=002f5VZmP6su839cp+TgzrheaoJIE2oOdZUk++Fs/lDEekHcSI8OwAm7EjTZSSyiRASm
	 8wq2VPleKgXCDuKVDUHReDg6yopMpRarm78AFceGVXEBIwTlZwyCLIQzZTxaXnqFuKWkL
	 nRZ6JByhfLv33KgROS2or56knGl8N7OnoCXxO8gEq7t51MO6ESTLZY8DXwpzJnLOtzygV
	 cdWXVXgyVGRY86q8bcDPa+AiViPMxsgNduX3SozR0uuFLDOSOBQ5X1GdkPeYWuFOVyrg4
	 RowBYxbr5EY34wEycRNFNe9mbvJKJBV6quimGXx4FjRfbJGkauiyrxR2cuQNHOZUl9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794214771;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-NdB-Source:X-P350-Id:From:To:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:Accept-Language:Content-Language:X-MS-Has-Attach:
	 X-MS-TNEF-Correlator:x-originating-ip:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-Rusd;
	bh=hSwUYL8WeZx+RaHnHd6F89odflTynfk+2qpBXaaiAS0=;
	b=IWp0awbwO5ye2KKkBWYQhvxQ/IjUGmxbxoZU4UJFwljg5m2PR5BlSqcWy9UY7ZPiFau0
	 IjmePx83tPIozsAdbpdbAntupWI9dRH34LwVyW94BHRfSEGcACi5DlctH0PvZTL/250K+
	 tTZstziKs8W4G3tAkpzhGJIbC0GTLH42SVc/RWSWyX2RUBPrtdS5OBMAWE1KKnRYl/YGE
	 SbgYFGVWXvBzOglyx1ugNdS9rSaHdax88+6CIAYmu0akCalDtUxQvHyGgfr47z0b8Js5Y
	 WoT0JD61/jnOzaNu495xbDXKHPEc07JdoqH9Ezxk7EdqR+ShRGXySVxq1FG+PWgItmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bfs.de;
	spf=pass smtp.mailfrom=bfs.de;
	dkim=pass header.d=bfs.de header.i=@bfs.de header.a=ed25519-sha256 header.s=260302-9830-ed25519 header.b=Y38UkvMV;
	dkim=pass header.d=bfs.de header.i=@bfs.de header.a=rsa-sha256 header.s=260302-9830-rsa header.b=ZPi7b1HK;
	arc=none smtp.remote-ip=77.87.224.107
Received: from m3-bln.bund.de (m3-bln.bund.de [77.87.224.107])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132A3606A31C
	for <linux-man@vger.kernel.org>; Mon,  9 Nov 2026 08:59:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 132A3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bfs.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bfs.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=bfs.de header.i=@bfs.de header.a=ed25519-sha256 header.s=260302-9830-ed25519 header.b=Y38UkvMV;
	dkim=pass (2048-bit key, unprotected) header.d=bfs.de header.i=@bfs.de header.a=rsa-sha256 header.s=260302-9830-rsa header.b=ZPi7b1HK
Received: from m3-bln.bund.de (localhost [127.0.0.1])
	by m3-bln.bund.de (Postfix) with ESMTP id 714F9208478
	for <linux-man@vger.kernel.org>; Mon,  9 Nov 2026 09:59:21 +0100 (CET)
Received: (from localhost) by m3-bln.bund.de (MSCAN) id 5/m3-bln.bund.de/smtp-gw/mscan;
     Mon Nov 9 09:59:21 2026
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=bfs.de;
	s=260302-9830-ed25519; t=1794214760;
	bh=hSwUYL8WeZx+RaHnHd6F89odflTynfk+2qpBXaaiAS0=;
	h=From:To:Subject:Date:Content-Type:Content-Transfer-Encoding:
	 MIME-Version:Autocrypt:Cc:Content-Transfer-Encoding:Date:From:
	 In-Reply-To:Openpgp:References:Reply-To:Resent-To:Sender:Subject:
	 To;
	b=Y38UkvMVcy3xCZaJKw927KQI4gpWBDRv/pIEBr2pUGnMf2lV5co/DbHf9yaubDffU
	 lCC1N3NuQUxKuQZzw2eCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bfs.de;
	s=260302-9830-rsa; t=1794214760;
	bh=hSwUYL8WeZx+RaHnHd6F89odflTynfk+2qpBXaaiAS0=;
	h=From:To:Subject:Date:Content-Type:Content-Transfer-Encoding:
	 MIME-Version:Autocrypt:Cc:Content-Transfer-Encoding:Date:From:
	 In-Reply-To:Openpgp:References:Reply-To:Resent-To:Sender:Subject:
	 To;
	b=ZPi7b1HKdxRSy+bZ89MYE/rjEzpaN1i+zWtMxszqUgMbJ+lj79pjx/ZObx4I0XUN3
	 l/WrbmfvF0J59zblchSugolmsI7QCYAUCUTb9ahd5yFakTIWEHWK8NfXT0EIS0U4WH
	 H2Gpym69RRygk23ZQzKnfnxNEpfI+Xiw1yTnhwe51WB2pEAmeK5P8ArFt4fFJ9V558
	 UaNCIKbchIuDkfJu4amp561EJayYyJFkFTltXhZEaMuH2i1CWFCiDVLzt9d8LZY1sc
	 3MB1TTnATKAx6zVqHxl1Q98NH2P+h1GDszBcQWWjsoUvJnbSY/UfxaJOa2vJ+ppFaL
	 kgat8zQpO4CFA==
X-NdB-Source: NdB
X-P350-Id: 578c5b4101626fc8
From: Walter Harms <wharms@bfs.de>
To: "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>
Subject: RFC: how to document musl-crypt failure ?
Thread-Topic: how to document musl-crypt failure ?
Thread-Index: AQHdcCd6uYn+7aT+PE2BRlp1cG8NYw==
Date: Mon, 9 Nov 2026 08:59:19 +0000
Message-ID: <ad592d57700043c181886d95b2564e6b@bfs.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Rusd: domwl, Pass through domain bfs.de

Hello list,
in case someone missed it: musl crypt() had an documented but unexpected be=
havier that caused
a lot of trouble. See: https://news.ycombinator.com/item?id=3D50377221   SS=
HHole.com  CVE-2026-123158

Normaly i would step over it but in this special case ... it would like to =
start a discussion if we should mention
that in a note to crypt(). Perhaps recommending an additional check for '*'=
 ? I am not sure but this is a very special case ...

CU =
