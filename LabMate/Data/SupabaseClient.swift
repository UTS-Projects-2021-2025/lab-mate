//
//  SupabaseClient.swift
//  LabMate
//
//  Created by Euan Mendoza on 12/5/2024.
//

import Foundation
import Supabase

let supabase = SupabaseClient(
  supabaseURL: URL(string: "https://iekusptxjllpvmilfoio.supabase.co")!,
  supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imlla3VzcHR4amxscHZtaWxmb2lvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE1MTg1MjIsImV4cCI6MjAyNzA5NDUyMn0.ZdrL7lqxydOXA1ih1eNCyAYfUHII-vLmn54UpgGQn7g"
);
