//
//  Supabase.swift
//  LMessenger
//
//  Created by JungWoo Choi on 23/3/2024.
//

import Foundation
import Supabase

let supabase = SupabaseClient(
  supabaseURL: URL(string: "https://peghlavgqanejutwhzny.supabase.co")!,
  supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBlZ2hsYXZncWFuZWp1dHdoem55Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDU5NzY3OTUsImV4cCI6MjAyMTU1Mjc5NX0.BjihE57gwqNGnBezwItmBm96rtNbKIOJh_W_XdKii7I"
)

let auth = supabase.auth
