Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE6B25E469
	for <linux-man@vger.kernel.org>; Fri,  7 Aug 2026 04:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786075796; cv=none; b=FyPMmTL+U5n96YtBmC3SbQXR7E7/pRiNgMZsZ8AHHwZiuFGRf8iyGCjQoILK8L5GvIL1lfe8cKFtJ8EG3/Iy/Ks4Fm6U1PlMyXWprpqCBaOTwxq2mkcM/H3aiYIeTFG4oYgIID18Z9oAbnDWBw0oC/pSn+3PURWPDMpYPg+CAdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786075796; c=relaxed/simple;
	bh=gQv6VILeQUOsPGC+F+GyjBEOAObzoWTSTiBk/eaJi4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l9v+m4LKsK443Je6+R1O3Gj8gMBmpHVsdKlKIfNadtVem0KvCYasVJeUtrBtYyHQwt7EFDaTm+h0J1aJSK+0kqp6axkVPeP8UezgFS7bN+jC1tx6UJnFA8alPP0GoDNMdUYnHakpnYXp2syWKJIo0kh1D5imyQk7HnbxH0cqCb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bmj4zsXv; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bmj4zsXv"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-668c1b780e5so4450292d50.2
        for <linux-man@vger.kernel.org>; Thu, 06 Aug 2026 21:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786075794; x=1786680594; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ppBRquQ7NnbjlW4efKWsNrhoxvGbbT4teEKQu51ZVoU=;
        b=bmj4zsXv8Vag5MD0Mtn856wcvS7ebYy/UBmgnRGScSichZ8u5iSaPJHeBfUbohzkF9
         6rGeN62MEUYQfoWrIghw+ivDnXqo2xSinekb+rCw5uyMSy0Uwi3OtEd6aMomxgTNLiwO
         9i/fTuuTxnwVN1FN1nTJrAQ+761c3UNDe43IPOUiSolwecggtVTt5+5aAxhAsaUlMQxP
         NrKpTdCGUbqtadwgAlgXPs9pJA7Pv/ZgZ0mIZJr6UIOjXhEXccwg44Ub5DzLxC6BCwLQ
         jX1qtv/j9UA6rCInvktDWHg8Vz/9gp3PjG8wELPYVSCwK+Xdtxpun11YSspJMaY3bYa5
         tKhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786075794; x=1786680594;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ppBRquQ7NnbjlW4efKWsNrhoxvGbbT4teEKQu51ZVoU=;
        b=qdPkehqmdyXjQ6pNSa8vcQkiH4VbC+jrh+M6aQ2UlEHMMcRP6k9NVe4LVQ+d4cP9/o
         45H1JUXj6+DE7mX8o7pyC92Dxf8+MVJ+UBUVfwrPFhUwkJ2PdqSp2cJgLqTnFcbV6pHB
         DHg+3m07sF6Yh32HxBizASYxkatZDWAI6/p3YKIzsOecon69bFYuvzVWiy0N03hAfRdT
         f75Gb/xB5jZmNOifLk/VywLFDY4Zaa8VEIvDt1O+nuG9nyOr5nCxV7EzOyawMBLvYvqx
         gzf2dEn3P3PN9q3x1tPrHlp/K36gWvSejom9SUjnb+QROweJp24YEfqnB63Ij6a0VyxY
         tKcg==
X-Forwarded-Encrypted: i=1; AHgh+RpnNowx4iS0ff0otVJ0r20Z6nf9DY91i5pQD0fuASyCC4Xm2rdgpgzVZkUm5ulGgWYsCZ6g5iSvhag=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuzfrPpSZj33fZPhYrfiYgTm7NdPRQb+w+CYz7A9Ad3jCAx8Vb
	cdEr0AqPlF3r4XBVd/Ao9NUkPBtspBJZ33KY9ubBn8WH+u5SUBCpVdjE3e9h/w==
X-Gm-Gg: AR+sD11yEMUXC65TxMX63006cAsjOksER8BcuAVlhGGLYPCON/A+8dg5rZVn3CPiOug
	thOu2oe5XiGBkyN52CyvW9NPt+Cbcc3jGAOuQC8vD2bTyM2W7PO4+nWfO7YqSg2p386Ot31IwgB
	eW883ndJcNrQdFNFTHJdhtdihQuxwVc9KohpQTiEdo5D8FHt4gAeRnjGUEiaJ61rFPlM88yXBAc
	WcXI3o1E8lV9mkl+lYcMtmfd9S+XZGCfL5/sbYDwQX7wc2jVlYluNpWD0Q3dADwCAx+9qgt5Mlt
	PmR/Tg7O1p1fD/xZFkfxY2FRX0wahQvRZjizW0z5qIFNcj+0Zd+uIvbG6eYMy2OQBANZsYqbxHN
	USF2WCO1PKUwMWp/7LFCdGqeJzuWyVu1hy31dGcWTSz1jHdE7Fl0yLEOti5xtgvJ7Bp/wNeboKN
	g3W4DMeJDo7uVcJcHLIO6EApYXC2sUtdLgn5yzdZvfFXhgkEYwgg==
X-Received: by 2002:a05:690e:4883:20b0:668:8b5b:75a8 with SMTP id 956f58d0204a3-6699a8f6ca2mr9540461d50.2.1786075794184;
        Thu, 06 Aug 2026 21:09:54 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980::41])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66acacdbea9sm546166d50.3.2026.08.06.21.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 21:09:53 -0700 (PDT)
Date: Thu, 6 Aug 2026 23:09:51 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: DJ Delorie <dj@redhat.com>
Cc: alx@kernel.org, linux-man@vger.kernel.org
Subject: Re: [PATCH v4 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
Message-ID: <20260807040951.cnxf7c2jr5ayixsp@illithid>
References: <20260807034935.elgrkedh7c2a4txp@illithid>
 <xno6fe37fb.fsf@greed.delorie.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rxfbcg5v665c3dkb"
Content-Disposition: inline
In-Reply-To: <xno6fe37fb.fsf@greed.delorie.com>


--rxfbcg5v665c3dkb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
MIME-Version: 1.0

At 2026-08-07T00:01:44-0400, DJ Delorie wrote:
> "G. Branden Robinson" <g.branden.robinson@gmail.com> writes:
> > Right.  But having to know that is one of those fiddly details that
> > deters people from using man(7), no?
>=20
> Sure.  I vastly prefer semantic syntax like <ul> in HTML to the
> presentation syntax in roff.  My complaint was just that I didn't know
> how .PD worked and had to figure out where to put them, because
> placement mattered and didn't do what I initially expected.

Yes; I believe that's a fair criticism of `PD`, and is one reason I
think the new `LS`/`LE` macros can be helpful to man(7) page authors.

Regards,
Branden

--rxfbcg5v665c3dkb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmp1WogACgkQ0Z6cfXEm
bc4sAA//dpJvF6ZwqcpYW+Gwxw1XJQFPUHS0FcgeMbSIW2JFSNy/xvvLPtUR1kYf
zbGOqFcNQ14OXj49SsyOASNWuD7tXdOD4jgOFRufqLt2IIJWP1GN1UZzjCL/XHvt
PhAN6Hk32dxRONbOrWHEH71RwucgHCEUNA5dTLbPWFzu5+zaaNo8vZhhP1hZMBgA
xKvOGyoeReDJ3ML3nri1+oBMRLz+LA2mzJ/PYn4exr5Un/G0nbJQ2bHbNGOzD8zp
PqeuB3yBtVIorvg7OlgKXZ/1Fidp3ae5NUHVddjwjJvSIWfyxMz9OeRiLkH7neoF
dp/cE6kV/Q+T1ntDzmVJRYRq3NnMXRlWpEySzQODtiBEexWWenJ3AzUNOFbhD3Qp
z/uesyH8eJ9n0eCewgwxxVjO/c5WECsY7giXGYVShS2x81y95OVXdA+Feqo9KHta
xb3DdBtLCbAPS/WjQhF1LYIC7CxQez6OEwqb5ijIi96+n9+RspjALj0lnMlBXrV+
Qpdu5me5U3nBM8TtFMkZ2v4rWhJ8bWHX7xbFfreOgtABSeVENGN/wdtMySAdUBV0
O1wxMxl6+7VOQBPYTCJrnnhfAwuRfIUObjK6D+c2cUvkJ0JxgUPAy9MKjo53Zped
o/Xai79qL0Zf8HHSuCMv71S5cSHuKSSJTQt7IuZjVyqNxaFJCN4=
=/PbM
-----END PGP SIGNATURE-----

--rxfbcg5v665c3dkb--
